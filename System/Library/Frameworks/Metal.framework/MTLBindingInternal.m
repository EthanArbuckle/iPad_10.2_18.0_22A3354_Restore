@implementation MTLBindingInternal

- (unint64_t)index
{
  return self->_index;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isActive
{
  return self->_isUsed;
}

- (id)dataTypeDescription
{
  return self->_typeInfo;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setIsArgument:(BOOL)a3
{
  self->_argument = a3;
}

- (MTLBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 index:(unint64_t)a6 active:(BOOL)a7 arrayLength:(unint64_t)a8
{
  MTLBindingInternal *v14;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTLBindingInternal;
  v14 = -[MTLBindingInternal init](&v17, sel_init);
  v14->_name = (NSString *)a3;
  v15 = a3;
  v14->_type = a4;
  v14->_access = a5;
  v14->_index = a6;
  v14->_isUsed = a7;
  v14->_arrayLength = a8;
  v14->_typeInfo = 0;
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLBindingInternal;
  -[MTLBindingInternal dealloc](&v3, sel_dealloc);
}

- (unint64_t)arrayLength
{
  return self->_arrayLength;
}

- (unint64_t)access
{
  return self->_access;
}

- (MTLBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 index:(unint64_t)a6 active:(BOOL)a7 arrayLength:(unint64_t)a8 typeDescription:(id)a9
{
  MTLBindingInternal *v15;
  id v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTLBindingInternal;
  v15 = -[MTLBindingInternal init](&v18, sel_init);
  v15->_name = (NSString *)a3;
  v16 = a3;
  v15->_type = a4;
  v15->_access = a5;
  v15->_index = a6;
  v15->_isUsed = a7;
  v15->_arrayLength = a8;
  v15->_typeInfo = (MTLType *)a9;
  return v15;
}

- (MTLStructType)structType
{
  return 0;
}

- (BOOL)isDepthTexture
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal isDepthTexture]", 1685, (uint64_t)CFSTR("Querying isDepthTexture on an argument that is not a texture"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)bufferAlignment
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal bufferAlignment]", 1691, (uint64_t)CFSTR("Querying buffer alignment on an argument that is not a buffer"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)bufferDataSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal bufferDataSize]", 1697, (uint64_t)CFSTR("Querying buffer data size on an argument that is not a buffer"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)bufferDataType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal bufferDataType]", 1703, (uint64_t)CFSTR("Querying buffer data type on an argument that is not a buffer"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)indirectConstantAlignment
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal indirectConstantAlignment]", 1709, (uint64_t)CFSTR("Querying indirect constant alignment on an argument that is not an indirect constant"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)indirectConstantDataSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal indirectConstantDataSize]", 1715, (uint64_t)CFSTR("Querying indirect constant data size on an argument that is not an indirect constant"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)indirectConstantDataType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal indirectConstantDataType]", 1721, (uint64_t)CFSTR("Querying indirect constant data type on an argument that is not an indirect constant"), v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLArgument)bufferIndirectArgumentType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal bufferIndirectArgumentType]", 1727, (uint64_t)CFSTR("Not supported at this point"), v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLStructType)bufferStructType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal bufferStructType]", 1733, (uint64_t)CFSTR("Querying buffer struct type on an argument that is not a buffer"), v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLPointerType)bufferPointerType
{
  return 0;
}

- (unint64_t)threadgroupMemoryAlignment
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal threadgroupMemoryAlignment]", 1741, (uint64_t)CFSTR("Querying threadgroup memory alignment on an argument that is not a threadgroup memory"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)threadgroupMemoryDataSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal threadgroupMemoryDataSize]", 1747, (uint64_t)CFSTR("Querying threadgroup memory data size on an argument that is not a threadgroup memory"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)textureType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal textureType]", 1753, (uint64_t)CFSTR("Querying texture type on an argument that is not a texture"), v2, v3, v4, v5, vars0);
  return 2;
}

- (unint64_t)textureDataType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal textureDataType]", 1759, (uint64_t)CFSTR("Querying texture data type on an argument that is not a texture"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)objectPayloadAlignment
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal objectPayloadAlignment]", 1766, (uint64_t)CFSTR("Querying object payload alignment on an argument that is not an object payload"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)objectPayloadDataSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal objectPayloadDataSize]", 1772, (uint64_t)CFSTR("Querying object payload size on an argument that is not an object payload"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)meshVertexCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal meshVertexCount]", 1778, (uint64_t)CFSTR("Querying mesh vertex count on an argument that is not a mesh argument."), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)meshPrimitiveCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal meshPrimitiveCount]", 1784, (uint64_t)CFSTR("Querying mesh primitive count on an argument that is not a mesh argument"), v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)meshTopologyType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal meshTopologyType]", 1790, (uint64_t)CFSTR("Querying mesh topology on an argument that is not a mesh argument"), v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLStructTypeInternal)meshVertexStruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal meshVertexStruct]", 1796, (uint64_t)CFSTR("Querying mesh vertex struct on an argument that is not a mesh argument"), v2, v3, v4, v5, vars0);
  return 0;
}

- (MTLStructTypeInternal)meshPrimitiveStruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBindingInternal meshPrimitiveStruct]", 1802, (uint64_t)CFSTR("Querying mesh primitive struct on an argument that is not a mesh argument"), v2, v3, v4, v5, vars0);
  return 0;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  const __CFString *name;
  int64_t type;
  const __CFString *v12;
  unint64_t access;
  const __CFString *v14;
  const __CFString *v15;
  MTLType *typeInfo;
  const __CFString *v17;
  objc_super v19;
  _QWORD v20[23];

  v20[22] = *MEMORY[0x1E0C80C00];
  v6 = a3 + 4;
  v7 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v19.receiver = self;
  v19.super_class = (Class)MTLBindingInternal;
  v9 = -[MTLBindingInternal description](&v19, sel_description);
  v20[0] = v7;
  v20[1] = CFSTR("Name =");
  name = (const __CFString *)self->_name;
  if (!name)
    name = CFSTR("<none>");
  v20[2] = name;
  v20[3] = v7;
  v20[4] = CFSTR("Type =");
  type = self->_type;
  switch(type)
  {
    case 16:
      v12 = CFSTR("MTLBindingTypeImageblockData");
      break;
    case 17:
      v12 = CFSTR("MTLBindingTypeImageblock");
      break;
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
LABEL_9:
      v12 = CFSTR("Unknown");
      break;
    case 24:
      v12 = CFSTR("MTLBindingTypeVisibleFunctionTable");
      break;
    case 25:
      v12 = CFSTR("MTLBindingTypePrimitiveAccelerationStructure");
      break;
    case 26:
      v12 = CFSTR("MTLBindingTypeInstanceAccelerationStructure");
      break;
    case 27:
      v12 = CFSTR("MTLBindingTypeIntersectionFunctionTable");
      break;
    default:
      v12 = CFSTR("MTLBindingTypeBuffer");
      switch(type)
      {
        case 0:
          goto LABEL_17;
        case 1:
          v12 = CFSTR("MTLBindingTypeThreadgroupMemory");
          break;
        case 2:
          v12 = CFSTR("MTLBindingTypeTexture");
          break;
        case 3:
          v12 = CFSTR("MTLBindingTypeSampler");
          break;
        default:
          if (type != 34)
            goto LABEL_9;
          v12 = CFSTR("MTLBindingTypeObjectPayload");
          break;
      }
      break;
  }
LABEL_17:
  v20[5] = v12;
  v20[6] = v7;
  v20[7] = CFSTR("Access =");
  access = self->_access;
  if (access > 2)
    v14 = CFSTR("Unknown");
  else
    v14 = off_1E0FE50A0[access];
  v20[8] = v14;
  v20[9] = v7;
  v20[10] = CFSTR("LocationIndex =");
  if (self->_index == 0xFFFFFFFF)
    v15 = CFSTR("Non-Bindable");
  else
    v15 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v20[11] = v15;
  v20[12] = v7;
  v20[13] = CFSTR("Used =");
  v20[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUsed);
  v20[15] = v7;
  v20[16] = CFSTR("Argument =");
  v20[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_argument);
  v20[18] = v7;
  v20[19] = CFSTR("ArrayLength =");
  v20[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_arrayLength);
  typeInfo = self->_typeInfo;
  if (typeInfo)
    v17 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ TypeInfo = %@"), v7, -[MTLType formattedDescription:withPrintedTypes:](typeInfo, "formattedDescription:withPrintedTypes:", v6, a4));
  else
    v17 = &stru_1E0FE5DC8;
  v20[21] = v17;
  return (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 22), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)formattedDescription:(unint64_t)a3
{
  id v5;
  id v6;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[MTLBindingInternal formattedDescription:withPrintedTypes:](self, "formattedDescription:withPrintedTypes:", a3, v5);

  return v6;
}

- (NSString)description
{
  id v3;
  NSString *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[MTLBindingInternal formattedDescription:withPrintedTypes:](self, "formattedDescription:withPrintedTypes:", 0, v3);

  return v4;
}

- (BOOL)isUsed
{
  return self->_isUsed;
}

- (void)setIsUsed:(BOOL)a3
{
  self->_isUsed = a3;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  MTLType *typeInfo;

  if (!a3)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  v5 = -[NSString isEqual:](self->_name, "isEqual:", *((_QWORD *)a3 + 5));
  if (!v5)
    return v5;
  if (self->_type != *((_QWORD *)a3 + 6)
    || self->_access != *((_QWORD *)a3 + 7)
    || self->_index != *((_QWORD *)a3 + 8)
    || self->_isUsed != *((unsigned __int8 *)a3 + 72)
    || self->_arrayLength != *((_QWORD *)a3 + 10))
  {
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  typeInfo = self->_typeInfo;
  if ((unint64_t)typeInfo | *((_QWORD *)a3 + 11))
    LOBYTE(v5) = -[MTLType isEqual:](typeInfo, "isEqual:");
  else
    LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)isArgument
{
  return self->_argument;
}

- (unint64_t)builtInType
{
  return self->_builtInType;
}

- (unint64_t)builtInDataType
{
  return self->_builtInDataType;
}

- (unint64_t)imageBlockKind
{
  return self->_imageBlockKind;
}

- (unint64_t)imageBlockDataSize
{
  return self->_imageBlockDataSize;
}

- (MTLStructTypeInternal)imageBlockMasterStructMembers
{
  return (MTLStructTypeInternal *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)aliasImplicitImageBlock
{
  return self->_aliasImplicitImageBlock;
}

- (unint64_t)aliasImplicitImageBlockRenderTarget
{
  return self->_aliasImplicitImageBlockRenderTarget;
}

- (BOOL)isVertexDescriptorBuffer
{
  return self->_vertexDescriptorBuffer;
}

- (unint64_t)threadgroupMemoryDataType
{
  return self->_threadgroupMemoryDataType;
}

- (MTLStructType)threadgroupMemoryStructType
{
  return (MTLStructType *)objc_getProperty(self, a2, 160, 1);
}

@end

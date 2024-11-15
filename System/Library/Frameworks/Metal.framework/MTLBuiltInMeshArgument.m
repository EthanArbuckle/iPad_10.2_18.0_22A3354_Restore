@implementation MTLBuiltInMeshArgument

- (MTLBuiltInMeshArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 active:(BOOL)a6 index:(unint64_t)a7 dataType:(unint64_t)a8 builtInType:(unint64_t)a9 meshVertexStructType:(id)a10 meshPrimitiveStructType:(id)a11 meshVertexCount:(unsigned __int16)a12 meshPrimitiveCount:(unsigned __int16)a13 meshTopologyType:(unint64_t)a14
{
  unsigned __int16 v14;
  MTLBuiltInMeshArgument *v15;
  objc_super v17;

  v14 = a8;
  v17.receiver = self;
  v17.super_class = (Class)MTLBuiltInMeshArgument;
  v15 = -[MTLBindingInternal initWithName:type:access:index:active:arrayLength:](&v17, sel_initWithName_type_access_index_active_arrayLength_, a3, a4, a5, a7, a6, 1);
  v15->_builtInType = a9;
  v15->_builtInDataType = v14;
  v15->_meshVertexStruct = (MTLStructTypeInternal *)a10;
  v15->_meshPrimitiveStruct = (MTLStructTypeInternal *)a11;
  v15->_meshVertexCount = a12;
  v15->_meshPrimitiveCount = a13;
  v15->_meshTopologyType = a14;
  return v15;
}

- (unint64_t)builtInDataType
{
  return self->_builtInDataType;
}

- (unint64_t)builtInType
{
  return self->_builtInType;
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  MTLStructTypeInternal *meshVertexStruct;
  const __CFString *v10;
  uint64_t v11;
  MTLStructTypeInternal *meshPrimitiveStruct;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t meshTopologyType;
  const __CFString *v18;
  void *v20;
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[5];

  v27[3] = *MEMORY[0x1E0C80C00];
  v5 = a3 + 4;
  v6 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v20 = (void *)MEMORY[0x1E0CB3940];
  v21.receiver = self;
  v21.super_class = (Class)MTLBuiltInMeshArgument;
  v7 = -[MTLBindingInternal formattedDescription:](&v21, sel_formattedDescription_, a3);
  v27[0] = v6;
  v27[1] = CFSTR("BuiltInArgumentType =");
  v27[2] = MTLBuiltInArgumentTypeString(self->_builtInType);
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3), "componentsJoinedByString:", CFSTR(" "));
  v26[0] = v6;
  v26[1] = CFSTR("MeshVertexStructMembers =");
  meshVertexStruct = self->_meshVertexStruct;
  if (meshVertexStruct)
    v10 = (const __CFString *)-[MTLStructTypeInternal formattedDescription:](meshVertexStruct, "formattedDescription:", v5);
  else
    v10 = CFSTR("nil");
  v26[2] = v10;
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3), "componentsJoinedByString:", CFSTR(" "));
  v25[0] = v6;
  v25[1] = CFSTR("MeshPrimitiveStructMembers =");
  meshPrimitiveStruct = self->_meshPrimitiveStruct;
  if (meshPrimitiveStruct)
    v13 = (const __CFString *)-[MTLStructTypeInternal formattedDescription:](meshPrimitiveStruct, "formattedDescription:", v5);
  else
    v13 = CFSTR("nil");
  v25[2] = v13;
  v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3), "componentsJoinedByString:", CFSTR(" "));
  v24[0] = v6;
  v24[1] = CFSTR("MeshVertexCount =");
  v24[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_meshVertexCount);
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3), "componentsJoinedByString:", CFSTR(" "));
  v23[0] = v6;
  v23[1] = CFSTR("MeshPrimitiveCount =");
  v23[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_meshPrimitiveCount);
  v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3), "componentsJoinedByString:", CFSTR(" "));
  v22[0] = v6;
  v22[1] = CFSTR("MeshTopologyType =");
  meshTopologyType = (__int16)self->_meshTopologyType;
  if (meshTopologyType > 3)
    v18 = CFSTR("Unknown");
  else
    v18 = off_1E0FE30E0[meshTopologyType];
  v22[2] = v18;
  return (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@"), v7, v8, v11, v14, v15, v16, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (void)dealloc
{
  objc_super v3;

  self->_meshVertexStruct = 0;
  self->_meshPrimitiveStruct = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLBuiltInMeshArgument;
  -[MTLBindingInternal dealloc](&v3, sel_dealloc);
}

- (unint64_t)meshVertexCount
{
  return self->_meshVertexCount;
}

- (unint64_t)meshPrimitiveCount
{
  return self->_meshPrimitiveCount;
}

- (unint64_t)meshTopologyType
{
  return self->_meshTopologyType;
}

- (id)meshVertexStruct
{
  return self->_meshVertexStruct;
}

- (id)meshPrimitiveStruct
{
  return self->_meshPrimitiveStruct;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  objc_super v7;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_builtInType == *((unsigned __int16 *)a3 + 84)
      && self->_builtInDataType == *((unsigned __int16 *)a3 + 85)
      && self->_meshVertexCount == *((unsigned __int16 *)a3 + 86)
      && self->_meshPrimitiveCount == *((unsigned __int16 *)a3 + 87)
      && self->_meshTopologyType == *((unsigned __int16 *)a3 + 88))
    {
      v5 = -[MTLStructTypeInternal isEqual:](self->_meshVertexStruct, "isEqual:", *((_QWORD *)a3 + 23));
      if (v5)
      {
        v5 = -[MTLStructTypeInternal isEqual:](self->_meshPrimitiveStruct, "isEqual:", *((_QWORD *)a3 + 24));
        if (v5)
        {
          v7.receiver = self;
          v7.super_class = (Class)MTLBuiltInMeshArgument;
          LOBYTE(v5) = -[MTLBindingInternal isEqual:](&v7, sel_isEqual_, a3);
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

@end

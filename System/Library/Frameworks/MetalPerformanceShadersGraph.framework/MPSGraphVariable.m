@implementation MPSGraphVariable

- (id)initVariableWithData:(id)a3 dataType:(unsigned int)a4 shape:(id)a5
{
  id v8;
  id v9;
  MPSGraphVariable *v10;
  uint64_t v11;
  NSMutableArray *mpsndarrays;
  uint64_t v13;
  NSData *data;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPSGraphVariable;
  v10 = -[MPSGraphVariable init](&v16, sel_init);
  objc_storeStrong((id *)&v10->_shape, a5);
  v10->_value.impl = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", MEMORY[0x1E0C9AA60]);
  v11 = objc_claimAutoreleasedReturnValue();
  mpsndarrays = v10->_mpsndarrays;
  v10->_mpsndarrays = (NSMutableArray *)v11;

  v10->_dataType = a4;
  v13 = objc_msgSend(v8, "copyWithZone:", 0);
  data = v10->_data;
  v10->_data = (NSData *)v13;

  return v10;
}

+ (id)newVariableWithData:(id)a3 dataType:(unsigned int)a4 shape:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = a5;
  v9 = -[MPSGraphVariable initVariableWithData:dataType:shape:]([MPSGraphVariable alloc], "initVariableWithData:dataType:shape:", v7, v6, v8);

  return v9;
}

- (id)initVariableWithData:(id)a3 value:(Value)a4
{
  id v6;
  uint64_t MPSDataType;
  void *v8;
  Value *v9;

  v6 = a3;
  MPSDataType = getMPSDataType((_QWORD *)(*((_QWORD *)a4.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  getMPSShapeFromMLIR((uint64_t **)(*((_QWORD *)a4.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPSGraphVariable initVariableWithData:dataType:shape:](self, "initVariableWithData:dataType:shape:", v6, MPSDataType, v8);

  v9[3].impl = a4.impl;
  return v9;
}

- (id)initVariableWithMPSNDArray:(id)a3 value:(Value)a4
{
  -[NSMutableArray addObject:](self->_mpsndarrays, "addObject:", a3);
  self->_value = a4;
  return self;
}

- (id)mpsNDArrayWithDevice:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t MPSDataType;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_mpsndarrays;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "device", (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "registryID");
        LOBYTE(v11) = v11 == objc_msgSend(v4, "registryID");

        if ((v11 & 1) != 0)
        {
          v16 = v9;
          goto LABEL_12;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[NSMutableArray count](self->_mpsndarrays, "count");
  if (-[NSMutableArray count](self->_mpsndarrays, "count") && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v12 = (void *)MEMORY[0x1E0CC6FE0];
  MPSDataType = getMPSDataType((_QWORD *)(*((_QWORD *)self->_value.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  getMPSShapeFromMLIR((uint64_t **)(*((_QWORD *)self->_value.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  adaptForMPS(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptorWithDataType:shape:", MPSDataType, v15);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F50]), "initWithDevice:descriptor:", v4, v5);
  objc_msgSend(v16, "writeBytes:strideBytes:", -[NSData bytes](self->_data, "bytes"), 0);
  -[NSMutableArray addObject:](self->_mpsndarrays, "addObject:", v16);
LABEL_12:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphVariable *v3;
  MPSGraphVariable *v4;
  MPSGraphVariable *v5;

  v3 = self;
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (NSArray)shape
{
  return self->_shape;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (Value)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_mpsndarrays, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

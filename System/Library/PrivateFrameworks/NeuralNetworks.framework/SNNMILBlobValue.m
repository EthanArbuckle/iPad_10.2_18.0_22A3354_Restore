@implementation SNNMILBlobValue

- (SNNMILBlobValue)initWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6
{
  NSString *v10;
  NSArray *v11;
  NSNumber *v12;
  SNNMILBlobValue *v13;
  NSString *filename;
  NSString *v15;
  NSArray *dimensions;
  NSArray *v17;
  NSNumber *offset;
  objc_super v20;

  v10 = (NSString *)a3;
  v11 = (NSArray *)a4;
  v12 = (NSNumber *)a6;
  v20.receiver = self;
  v20.super_class = (Class)SNNMILBlobValue;
  v13 = -[SNNMILValue init](&v20, sel_init);
  filename = v13->_filename;
  v13->_filename = v10;
  v15 = v10;

  dimensions = v13->_dimensions;
  v13->_dimensions = v11;
  v17 = v11;

  v13->_dataType = a5;
  offset = v13->_offset;
  v13->_offset = v12;

  return v13;
}

- (unint64_t)length
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t i;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SNNMILBlobValue dimensions](self, "dimensions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v6 *= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
    v8 = v6;
  }
  else
  {
    v8 = 1;
  }

  v9 = -[SNNMILBlobValue dataType](self, "dataType");
  if (v9 - 2 > 0xA)
    v10 = 1;
  else
    v10 = qword_242C4B388[v9 - 2];
  return v10 * v8;
}

- (unique_ptr<const)milValueWithContext:(id)a3
{
  _QWORD *v3;
  _QWORD *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unique_ptr<const MIL::IRValue, std::default_delete<const MIL::IRValue>> v10;
  id v11;

  v5 = v3;
  v11 = a3;
  -[SNNMILBlobValue filename](self, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNNMILBlobValue dimensions](self, "dimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SNNMILBlobValue dataType](self, "dataType");
  -[SNNMILBlobValue offset](self, "offset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v11, "milValueForTensorBlobWithFilename:shape:dataType:offset:", v6, v7, v8, v9);
  else
    *v5 = 0;

  return v10;
}

- (NSString)filename
{
  return self->_filename;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

@end

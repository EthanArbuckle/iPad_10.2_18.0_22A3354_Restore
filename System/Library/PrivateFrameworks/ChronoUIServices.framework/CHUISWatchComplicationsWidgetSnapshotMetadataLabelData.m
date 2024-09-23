@implementation CHUISWatchComplicationsWidgetSnapshotMetadataLabelData

- (CHUISWatchComplicationsWidgetSnapshotMetadataLabelData)initWithData:(id)a3
{
  id v5;
  CHUISWatchComplicationsWidgetSnapshotMetadataLabelData *v6;
  CHUISWatchComplicationsWidgetSnapshotMetadataLabelData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWatchComplicationsWidgetSnapshotMetadataLabelData;
  v6 = -[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (id)copyForEncodingAtUrlDirectory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSData *data;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v4 = a3;
  if (self->_data)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    data = self->_data;
    v20 = 0;
    LOBYTE(v6) = -[NSData writeToURL:options:error:](data, "writeToURL:options:error:", v7, 1, &v20);
    v9 = v20;
    if ((v6 & 1) != 0)
    {
      v19 = v9;
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v7, &v19);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v19;

      if (v10)
      {
        v9 = v11;
        v12 = v10;
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeItemAtURL:error:", v7, 0);

        goto LABEL_13;
      }
      CHUISLogViewController();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData copyForEncodingAtUrlDirectory:].cold.1();
      v9 = v11;
    }
    else
    {
      CHUISLogViewController();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData copyForEncodingAtUrlDirectory:].cold.2();
    }

    v12 = 0;
    goto LABEL_12;
  }
  v12 = 0;
LABEL_13:
  v15 = (_QWORD *)-[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData copy](self, "copy");
  v16 = (void *)v15[1];
  v15[1] = 0;

  v17 = (void *)v15[2];
  v15[2] = v12;

  return v15;
}

- (NSData)data
{
  NSData *data;
  NSFileHandle *dataFileHandle;
  NSData *v5;
  NSData *v6;
  NSFileHandle *v7;

  data = self->_data;
  if (data)
    goto LABEL_4;
  dataFileHandle = self->_dataFileHandle;
  if (dataFileHandle)
  {
    -[NSFileHandle readDataToEndOfFile](dataFileHandle, "readDataToEndOfFile");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    v6 = self->_data;
    self->_data = v5;

    v7 = self->_dataFileHandle;
    self->_dataFileHandle = 0;

    data = self->_data;
LABEL_4:
    dataFileHandle = data;
  }
  return (NSData *)dataFileHandle;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_data);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_dataFileHandle);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSData *data;
  uint64_t v7;
  id v8;
  id v9;
  NSFileHandle *dataFileHandle;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__CHUISWatchComplicationsWidgetSnapshotMetadataLabelData_isEqual___block_invoke;
  v19[3] = &unk_1E6B84D50;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", data, v19);
  dataFileHandle = self->_dataFileHandle;
  v14 = v7;
  v15 = 3221225472;
  v16 = __66__CHUISWatchComplicationsWidgetSnapshotMetadataLabelData_isEqual___block_invoke_2;
  v17 = &unk_1E6B84D50;
  v11 = v8;
  v18 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", dataFileHandle, &v14);
  LOBYTE(v8) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)v8;
}

id __66__CHUISWatchComplicationsWidgetSnapshotMetadataLabelData_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __66__CHUISWatchComplicationsWidgetSnapshotMetadataLabelData_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CHUISWatchComplicationsWidgetSnapshotMetadataLabelData *v4;

  v4 = -[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData init](+[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData allocWithZone:](CHUISWatchComplicationsWidgetSnapshotMetadataLabelData, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_data, self->_data);
  objc_storeStrong((id *)&v4->_dataFileHandle, self->_dataFileHandle);
  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (self->_data)
  {
    CHUISLogViewController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData encodeWithBSXPCCoder:].cold.1(v5);

  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_dataFileHandle, CFSTR("dataFileHandle"));

}

- (CHUISWatchComplicationsWidgetSnapshotMetadataLabelData)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHUISWatchComplicationsWidgetSnapshotMetadataLabelData *v5;
  uint64_t v6;
  NSFileHandle *dataFileHandle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWatchComplicationsWidgetSnapshotMetadataLabelData;
  v5 = -[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataFileHandle"));
    v6 = objc_claimAutoreleasedReturnValue();
    dataFileHandle = v5->_dataFileHandle;
    v5->_dataFileHandle = (NSFileHandle *)v6;

  }
  return v5;
}

- (id)dataFileHandle
{
  return self->_dataFileHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFileHandle, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)copyForEncodingAtUrlDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B711E000, v0, v1, "%s: failed to create file handle: %@", v2, v3, v4, v5, 2u);
}

- (void)copyForEncodingAtUrlDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B711E000, v0, v1, "%s: failed to encode: %@", v2, v3, v4, v5, 2u);
}

- (void)encodeWithBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B711E000, log, OS_LOG_TYPE_FAULT, "Shouldn't be encoded with data", v1, 2u);
}

@end

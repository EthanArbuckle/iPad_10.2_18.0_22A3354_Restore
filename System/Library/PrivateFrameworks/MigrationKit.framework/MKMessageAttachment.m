@implementation MKMessageAttachment

- (MKMessageAttachment)initWithID:(id)a3 contentType:(id)a4 base64Data:(id)a5
{
  id v8;
  id v9;
  id v10;
  MKMessageAttachment *v11;
  MKMessageAttachment *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  MKMessageAttachment *v33;
  void *v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _QWORD v45[5];

  v45[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v43.receiver = self;
  v43.super_class = (Class)MKMessageAttachment;
  v11 = -[MKMessageAttachment init](&v43, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MKMessageAttachment setID:](v11, "setID:", v8);
    -[MKMessageAttachment setContentType:](v12, "setContentType:", v9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v10, 0);
    -[MKMessageAttachment setData:](v12, "setData:", v13);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessageAttachment setUUID:](v12, "setUUID:", v15);

    -[MKMessageAttachment setTransferState:](v12, "setTransferState:", 5);
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithMIMEType:", v12->_contentType);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessageAttachment setUniformTypeIdentifier:](v12, "setUniformTypeIdentifier:", v17);

    if (!v12->_uniformTypeIdentifier)
    {
      v33 = 0;
      goto LABEL_17;
    }
    v36 = v10;
    objc_msgSend(MEMORY[0x24BE50898], "defaultHFSFileManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pathExtensionForUTIType:", v12->_uniformTypeIdentifier);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v19, "length"))
    {
      objc_msgSend(MEMORY[0x24BE50898], "defaultHFSFileManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pathExtensionForMIMEType:", v9);
      v21 = objc_claimAutoreleasedReturnValue();

      v19 = (__CFString *)v21;
    }
    v37 = v9;
    if (!-[__CFString length](v19, "length"))
    {

      v19 = CFSTR("bin");
    }
    v38 = v8;
    v22 = -[NSString hash](v12->_UUID, "hash");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x"), v22);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02d"), v22 & 0xF);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathExtension:](v12->_UUID, "stringByAppendingPathExtension:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/SMS/Attachments"), "stringByResolvingAndStandardizingPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v23;
    v45[0] = v23;
    v45[1] = v24;
    v45[2] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v40;
      do
      {
        v31 = 0;
        v32 = v26;
        do
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(v32, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v31));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          ++v31;
          v32 = v26;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v29);
    }

    -[MKMessageAttachment setFilename:](v12, "setFilename:", v26);
    v9 = v37;
    v8 = v38;
    v10 = v36;
  }
  v33 = v12;
LABEL_17:

  return v33;
}

- (void)write
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString stringByDeletingLastPathComponent](self->_filename, "stringByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeDirectoriesInPath:mode:", v3, 448);
  -[NSData writeToFile:atomically:](self->_data, "writeToFile:atomically:", self->_filename, 1);

}

- (int64_t)transferState
{
  return self->_transferState;
}

- (void)setTransferState:(int64_t)a3
{
  self->_transferState = a3;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end

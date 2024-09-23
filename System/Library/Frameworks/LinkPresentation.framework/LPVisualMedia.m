@implementation LPVisualMedia

- (LPVisualMedia)init
{
  LPVisualMedia *v2;
  LPVisualMedia *v3;
  LPVisualMedia *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPVisualMedia;
  v2 = -[LPVisualMedia init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)_initWithLPVisualMedia:(id)a3
{
  id *v4;
  LPVisualMedia *v5;
  id *p_isa;
  id *v7;
  objc_super v9;

  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)LPVisualMedia;
  v5 = -[LPVisualMedia init](&v9, sel_init);
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_data, v4[1]);
    objc_storeStrong(p_isa + 2, v4[2]);
    objc_storeStrong(p_isa + 3, v4[3]);
    objc_storeStrong(p_isa + 4, v4[4]);
    v7 = p_isa;
  }

  return p_isa;
}

- (id)_initWithData:(id)a3 fileURL:(id)a4 MIMEType:(id)a5 properties:(id)a6
{
  id v11;
  id *v12;
  id *v13;
  id *v14;

  v11 = a4;
  v12 = -[LPVisualMedia _initWithData:MIMEType:properties:](self, "_initWithData:MIMEType:properties:", a3, a5, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 3, a4);
    v14 = v13;
  }

  return v13;
}

- (id)_initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v9;
  id v10;
  id v11;
  LPVisualMedia *v12;
  uint64_t v13;
  LPVisualMediaProperties *properties;
  LPVisualMedia *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LPVisualMedia;
  v12 = -[LPVisualMedia init](&v17, sel_init);
  if (v12)
  {
    if (!v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Trying to create an LPVisualMedia with nil data."));
    if (!v10)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Trying to create an LPVisualMedia with nil MIME type."));
    objc_storeStrong((id *)&v12->_data, a3);
    objc_storeStrong((id *)&v12->_MIMEType, a4);
    v13 = objc_msgSend(v11, "copy");
    properties = v12->_properties;
    v12->_properties = (LPVisualMediaProperties *)v13;

    v15 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)_encodedSize
{
  NSURL *fileURL;

  fileURL = self->_fileURL;
  if (fileURL)
    return -[NSURL _lp_fileSize](fileURL, "_lp_fileSize");
  else
    return -[NSData length](self->_data, "length");
}

- (void)setFileURL:(id)a3
{
  NSURL *v4;
  NSURL *fileURL;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isFileURL") & 1) != 0)
    v4 = (NSURL *)v6;
  else
    v4 = 0;
  fileURL = self->_fileURL;
  self->_fileURL = v4;

}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (id)_initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v9;
  id v10;
  id v11;
  LPVisualMedia *v12;
  uint64_t v13;
  LPVisualMediaProperties *properties;
  LPVisualMedia *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LPVisualMedia;
  v12 = -[LPVisualMedia init](&v17, sel_init);
  if (v12 && objc_msgSend(v9, "isFileURL"))
  {
    objc_storeStrong((id *)&v12->_fileURL, a3);
    objc_storeStrong((id *)&v12->_MIMEType, a4);
    v13 = objc_msgSend(v11, "copy");
    properties = v12->_properties;
    v12->_properties = (LPVisualMediaProperties *)v13;

    v15 = v12;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (LPVisualMedia)initWithProperties:(id)a3
{
  id v4;
  LPVisualMedia *v5;
  uint64_t v6;
  LPVisualMediaProperties *properties;
  LPVisualMedia *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPVisualMedia;
  v5 = -[LPVisualMedia init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    properties = v5->_properties;
    v5->_properties = (LPVisualMediaProperties *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSData)data
{
  LPVisualMedia *v2;
  NSData *data;
  NSURL *fileURL;
  uint64_t v5;
  id v6;
  NSData *v7;
  NSObject *v8;
  NSData *v9;
  id v11;

  v2 = self;
  objc_sync_enter(v2);
  data = v2->_data;
  if (!data)
  {
    fileURL = v2->_fileURL;
    if (fileURL)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", fileURL, 1, &v11);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v11;
      v7 = v2->_data;
      v2->_data = (NSData *)v5;

      if (v6)
      {
        v8 = LPLogChannelUI();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[LPVisualMedia data].cold.1((uint64_t)v6, v8);
      }

      data = v2->_data;
    }
    else
    {
      data = 0;
    }
  }
  v9 = data;
  objc_sync_exit(v2);

  return v9;
}

- (NSData)_cachedData
{
  LPVisualMedia *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_data;
  objc_sync_exit(v2);

  return v3;
}

- (LPVisualMediaProperties)properties
{
  return (LPVisualMediaProperties *)(id)-[LPVisualMediaProperties copy](self->_properties, "copy");
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[LPVisualMedia _isSubstitute](self, "_isSubstitute"))
  {
    -[LPVisualMedia data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("data"));

  }
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_MIMEType, CFSTR("MIMEType"));
  -[LPVisualMediaProperties accessibilityText](self->_properties, "accessibilityText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", v5, CFSTR("accessibilityText"));

}

- (BOOL)_canEncodeWithoutComputation
{
  return self->_data != 0;
}

- (LPVisualMedia)initWithCoderInternal:(id)a3
{
  id v4;
  LPVisualMedia *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSString *MIMEType;
  LPVisualMedia *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPVisualMedia;
  v5 = -[LPVisualMedia init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_lp_strictlyDecodeNSDataForKey:", CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", CFSTR("MIMEType"));
    v8 = objc_claimAutoreleasedReturnValue();
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (LPVisualMedia)initWithCoder:(id)a3 properties:(id)a4
{
  id v7;
  LPVisualMedia *v8;
  LPVisualMedia *v9;
  LPVisualMedia *v10;

  v7 = a4;
  v8 = -[LPVisualMedia initWithCoderInternal:](self, "initWithCoderInternal:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_properties, a4);
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPVisualMedia;
  if (-[LPVisualMedia isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_3(v6[1], self->_data) & 1) != 0
        && objectsAreEqual_3(v6[2], self->_MIMEType)
        && objectsAreEqual_3(v6[3], self->_fileURL))
      {
        v5 = objectsAreEqual_3(v6[4], self->_properties);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)data
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A0C41000, a2, OS_LOG_TYPE_ERROR, "LPVisualMedia: Failed to load data: %@", (uint8_t *)&v2, 0xCu);
}

@end

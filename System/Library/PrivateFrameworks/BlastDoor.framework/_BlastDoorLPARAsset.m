@implementation _BlastDoorLPARAsset

- (_BlastDoorLPARAsset)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorLPARAsset;
  return -[_BlastDoorLPARAsset init](&v3, sel_init);
}

- (id)_initWithARAsset:(id)a3
{
  id *v4;
  _BlastDoorLPARAsset *v5;
  id *p_isa;
  id *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)_BlastDoorLPARAsset;
  v5 = -[_BlastDoorLPARAsset init](&v9, sel_init);
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_data, v4[1]);
    objc_storeStrong(p_isa + 2, v4[2]);
    objc_storeStrong(p_isa + 5, v4[5]);
    objc_storeStrong(p_isa + 4, v4[4]);
    v7 = p_isa;
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)_encodedSize
{
  return -[NSData length](self->_data, "length");
}

- (_BlastDoorLPARAssetProperties)properties
{
  return (_BlastDoorLPARAssetProperties *)(id)-[_BlastDoorLPARAssetProperties copy](self->_properties, "copy");
}

- (BOOL)_shouldEncodeData
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_BlastDoorLPARAsset _shouldEncodeData](self, "_shouldEncodeData"))
  {
    -[_BlastDoorLPARAsset data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("data"));

  }
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_MIMEType, CFSTR("MIMEType"));
  -[_BlastDoorLPARAssetProperties accessibilityText](self->_properties, "accessibilityText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, CFSTR("accessibilityText"));

}

- (_BlastDoorLPARAsset)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPARAsset *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSString *MIMEType;
  _BlastDoorLPARAssetProperties *v10;
  _BlastDoorLPARAssetProperties *properties;
  void *v12;
  _BlastDoorLPARAsset *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPARAsset;
  v5 = -[_BlastDoorLPARAsset init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSDataForKey:", CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", CFSTR("MIMEType"));
    v8 = objc_claimAutoreleasedReturnValue();
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v8;

    v10 = objc_alloc_init(_BlastDoorLPARAssetProperties);
    properties = v5->_properties;
    v5->_properties = v10;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", CFSTR("accessibilityText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPARAssetProperties setAccessibilityText:](v5->_properties, "setAccessibilityText:", v12);

    v13 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPARAsset;
  if (-[_BlastDoorLPARAsset isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[1];
      if (v7 | (unint64_t)self->_data && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[2], v8 | (unint64_t)self->_MIMEType) && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[5], v9 | (unint64_t)self->_fileURL) && !objc_msgSend((id)v9, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v10 = v6[4];
        if (v10 | (unint64_t)self->_properties)
          v5 = objc_msgSend((id)v10, "isEqual:");
        else
          v5 = 1;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void)setMIMEType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end

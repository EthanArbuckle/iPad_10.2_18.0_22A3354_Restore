@implementation _BlastDoorLPAudio

- (_BlastDoorLPAudio)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorLPAudio;
  return -[_BlastDoorLPAudio init](&v3, sel_init);
}

- (id)_initWithAudio:(id)a3
{
  id *v4;
  _BlastDoorLPAudio *v5;
  _BlastDoorLPAudio *v6;
  uint64_t v7;
  NSData *data;
  uint64_t v9;
  NSString *MIMEType;
  uint64_t v11;
  _BlastDoorLPAudioProperties *properties;
  _BlastDoorLPAudio *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPAudio;
  v5 = -[_BlastDoorLPAudio init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_streamingURL, v4[3]);
    v7 = objc_msgSend(v4[1], "copy");
    data = v6->_data;
    v6->_data = (NSData *)v7;

    v9 = objc_msgSend(v4[2], "copy");
    MIMEType = v6->_MIMEType;
    v6->_MIMEType = (NSString *)v9;

    v11 = objc_msgSend(v4[4], "copy");
    properties = v6->_properties;
    v6->_properties = (_BlastDoorLPAudioProperties *)v11;

    v13 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAudio)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPAudio *v5;
  uint64_t v6;
  NSURL *streamingURL;
  uint64_t v8;
  NSData *data;
  uint64_t v10;
  NSString *MIMEType;
  _BlastDoorLPAudioProperties *v12;
  _BlastDoorLPAudioProperties *properties;
  void *v14;
  _BlastDoorLPAudio *v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_BlastDoorLPAudio;
  v5 = -[_BlastDoorLPAudio init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamingURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    streamingURL = v5->_streamingURL;
    v5->_streamingURL = (NSURL *)v6;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSDataForKey:", CFSTR("data"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", CFSTR("MIMEType"));
    v10 = objc_claimAutoreleasedReturnValue();
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v10;

    v12 = objc_alloc_init(_BlastDoorLPAudioProperties);
    properties = v5->_properties;
    v5->_properties = v12;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", CFSTR("accessibilityText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAudioProperties setAccessibilityText:](v5->_properties, "setAccessibilityText:", v14);

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_streamingURL, CFSTR("streamingURL"));
  if (-[_BlastDoorLPAudio _shouldEncodeData](self, "_shouldEncodeData"))
  {
    -[_BlastDoorLPAudio data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("data"));

  }
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_MIMEType, CFSTR("MIMEType"));
  -[_BlastDoorLPAudioProperties accessibilityText](self->_properties, "accessibilityText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, CFSTR("accessibilityText"));

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
  v12.super_class = (Class)_BlastDoorLPAudio;
  if (-[_BlastDoorLPAudio isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[3];
      if (v7 | (unint64_t)self->_streamingURL && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[1], v8 | (unint64_t)self->_data) && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[2], v9 | (unint64_t)self->_MIMEType) && !objc_msgSend((id)v9, "isEqual:"))
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

- (unint64_t)_encodedSize
{
  return -[NSData length](self->_data, "length");
}

- (_BlastDoorLPAudioProperties)properties
{
  return (_BlastDoorLPAudioProperties *)(id)-[_BlastDoorLPAudioProperties copy](self->_properties, "copy");
}

- (BOOL)_shouldEncodeData
{
  return 1;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void)setMIMEType:(id)a3
{
  objc_storeStrong((id *)&self->_MIMEType, a3);
}

- (NSURL)streamingURL
{
  return self->_streamingURL;
}

- (void)setStreamingURL:(id)a3
{
  objc_storeStrong((id *)&self->_streamingURL, a3);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_streamingURL, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end

@implementation _BlastDoorLPVideo

- (_BlastDoorLPVideo)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorLPVideo;
  return -[_BlastDoorLPVideo init](&v3, sel_init);
}

- (id)_initWithVideo:(id)a3
{
  id *v4;
  _BlastDoorLPVideo *v5;
  _BlastDoorLPVideo *v6;
  uint64_t v7;
  NSData *data;
  uint64_t v9;
  NSString *MIMEType;
  uint64_t v11;
  _BlastDoorLPVideoProperties *properties;
  _BlastDoorLPVideo *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPVideo;
  v5 = -[_BlastDoorLPVideo init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_streamingURL, v4[2]);
    objc_storeStrong((id *)&v6->_youTubeURL, v4[3]);
    v7 = objc_msgSend(v4[4], "copy");
    data = v6->_data;
    v6->_data = (NSData *)v7;

    v9 = objc_msgSend(v4[5], "copy");
    MIMEType = v6->_MIMEType;
    v6->_MIMEType = (NSString *)v9;

    objc_storeStrong((id *)&v6->_fileURL, v4[6]);
    v11 = objc_msgSend(v4[7], "copy");
    properties = v6->_properties;
    v6->_properties = (_BlastDoorLPVideoProperties *)v11;

    v13 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPVideo)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPVideo *v5;
  uint64_t v6;
  NSURL *streamingURL;
  uint64_t v8;
  NSURL *youTubeURL;
  uint64_t v10;
  NSData *data;
  uint64_t v12;
  NSString *MIMEType;
  _BlastDoorLPVideoProperties *v14;
  _BlastDoorLPVideoProperties *properties;
  void *v16;
  _BlastDoorLPVideo *v17;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_BlastDoorLPVideo;
  v5 = -[_BlastDoorLPVideo init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamingURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    streamingURL = v5->_streamingURL;
    v5->_streamingURL = (NSURL *)v6;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("youTubeURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    youTubeURL = v5->_youTubeURL;
    v5->_youTubeURL = (NSURL *)v8;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSDataForKey:", CFSTR("data"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v10;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", CFSTR("MIMEType"));
    v12 = objc_claimAutoreleasedReturnValue();
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v12;

    v14 = objc_alloc_init(_BlastDoorLPVideoProperties);
    properties = v5->_properties;
    v5->_properties = v14;

    -[_BlastDoorLPVideoProperties setHasAudio:](v5->_properties, "setHasAudio:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAudio")));
    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSStringForKey:", CFSTR("accessibilityText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPVideoProperties setAccessibilityText:](v5->_properties, "setAccessibilityText:", v16);

    v17 = v5;
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
  objc_msgSend(v6, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_youTubeURL, CFSTR("youTubeURL"));
  if (-[_BlastDoorLPVideo _shouldEncodeData](self, "_shouldEncodeData"))
  {
    -[_BlastDoorLPVideo data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("data"));

  }
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_MIMEType, CFSTR("MIMEType"));
  objc_msgSend(v6, "encodeBool:forKey:", -[_BlastDoorLPVideoProperties hasAudio](self->_properties, "hasAudio"), CFSTR("hasAudio"));
  -[_BlastDoorLPVideoProperties accessibilityText](self->_properties, "accessibilityText");
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
  unint64_t v11;
  unint64_t v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPVideo;
  if (-[_BlastDoorLPVideo isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if (v7 | (unint64_t)self->_streamingURL && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[3], v8 | (unint64_t)self->_youTubeURL) && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[4], v9 | (unint64_t)self->_data) && !objc_msgSend((id)v9, "isEqual:")
        || (v10 = v6[5], v10 | (unint64_t)self->_MIMEType) && !objc_msgSend((id)v10, "isEqual:")
        || (v11 = v6[6], v11 | (unint64_t)self->_fileURL) && !objc_msgSend((id)v11, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v12 = v6[7];
        if (v12 | (unint64_t)self->_properties)
          v5 = objc_msgSend((id)v12, "isEqual:");
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

- (void)setFileURL:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *fileURL;
  id v7;

  v4 = a3;
  if (self->_data)
    -[_BlastDoorLPVideo setFileURL:].cold.1();
  v7 = v4;
  if (objc_msgSend(v4, "isFileURL"))
    v5 = (NSURL *)v7;
  else
    v5 = 0;
  fileURL = self->_fileURL;
  self->_fileURL = v5;

}

- (BOOL)hasAudio
{
  return -[_BlastDoorLPVideoProperties hasAudio](self->_properties, "hasAudio");
}

- (BOOL)_shouldEncodeData
{
  return 1;
}

- (NSURL)streamingURL
{
  return self->_streamingURL;
}

- (void)setStreamingURL:(id)a3
{
  objc_storeStrong((id *)&self->_streamingURL, a3);
}

- (NSURL)youTubeURL
{
  return self->_youTubeURL;
}

- (void)setYouTubeURL:(id)a3
{
  objc_storeStrong((id *)&self->_youTubeURL, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void)setMIMEType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (_BlastDoorLPVideoProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_youTubeURL, 0);
  objc_storeStrong((id *)&self->_streamingURL, 0);
}

- (void)setFileURL:.cold.1()
{
  __assert_rtn("-[_BlastDoorLPVideo setFileURL:]", "_BlastDoorLPVideo.m", 162, "!_data");
}

@end

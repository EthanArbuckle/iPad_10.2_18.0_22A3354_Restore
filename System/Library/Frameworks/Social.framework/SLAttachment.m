@implementation SLAttachment

- (SLAttachment)init
{
  return -[SLAttachment initWithPayload:type:previewImage:](self, "initWithPayload:type:previewImage:", 0, 0, 0);
}

- (SLAttachment)initWithPayload:(id)a3 type:(int64_t)a4 previewImage:(id)a5
{
  id v9;
  id v10;
  SLAttachment *v11;
  SLAttachment *v12;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SLAttachment;
  v11 = -[SLAttachment init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_payload, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_previewImage, a5);
    -[SLAttachment _uniqueIdentifier](v12, "_uniqueIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

  }
  return v12;
}

- (id)_uniqueIdentifier
{
  const __CFAllocator *v2;
  const __CFUUID *v3;
  __CFString *v4;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  CFRelease(v3);
  return v4;
}

- (SLAttachment)initWithCoder:(id)a3
{
  id v4;
  SLAttachment *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SLAttachment *v13;
  objc_super v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLAttachment;
  v5 = -[SLAttachment init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("payload"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttachment setPayload:](v5, "setPayload:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewImage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttachment setPreviewImage:](v5, "setPreviewImage:", v12);

    -[SLAttachment setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
    -[SLAttachment setPreviewType:](v5, "setPreviewType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("previewType")));
    -[SLAttachment setDownsampleStatus:](v5, "setDownsampleStatus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downsampleStatus")));
    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(&unk_1E75AE008, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(&unk_1E75AE008);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[SLAttachment valueForKey:](self, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

      }
      v6 = objc_msgSend(&unk_1E75AE008, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[SLAttachment type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SLAttachment previewType](self, "previewType"), CFSTR("previewType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SLAttachment downsampleStatus](self, "downsampleStatus"), CFSTR("downsampleStatus"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPreviewImage:(id)a3
{
  void (**previewUpdateObserver)(void);
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_previewImage, a3);
  previewUpdateObserver = (void (**)(void))self->_previewUpdateObserver;
  if (previewUpdateObserver)
    previewUpdateObserver[2]();

}

- (void)setPayload:(id)a3
{
  void (**payloadUpdateObserver)(void);
  id v6;

  v6 = a3;
  objc_storeStrong(&self->_payload, a3);
  payloadUpdateObserver = (void (**)(void))self->_payloadUpdateObserver;
  if (payloadUpdateObserver)
    payloadUpdateObserver[2]();

}

- (void)setPreviewUpdateObserverWithBlock:(id)a3
{
  void *v4;
  id previewUpdateObserver;

  v4 = (void *)MEMORY[0x1C3B6C8B8](a3, a2);
  previewUpdateObserver = self->_previewUpdateObserver;
  self->_previewUpdateObserver = v4;

}

- (void)setPayloadUpdateObserverWithBlock:(id)a3
{
  void *v4;
  id payloadUpdateObserver;

  v4 = (void *)MEMORY[0x1C3B6C8B8](a3, a2);
  payloadUpdateObserver = self->_payloadUpdateObserver;
  self->_payloadUpdateObserver = v4;

}

- (void)setItemProvider:(id)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  id v9;

  objc_storeStrong((id *)&self->_itemProvider, a3);
  self->_itemProviderPreviewType = 0;
  if (self->_itemProvider)
  {
    -[SLAttachment itemProvider](self, "itemProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SLItemProviderHasPreview"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _SLLog(v3, 7, CFSTR("SLAttachment assigned itemProvider with SLItemProviderHasPreview %@"));
      v7 = objc_msgSend(v9, "BOOLValue", v9);
      v8 = 1;
      if (!v7)
        v8 = 2;
      self->_itemProviderPreviewType = v8;
    }
    else
    {
      _SLLog(v3, 7, CFSTR("SLAttachment assigned itemProvider with no SLItemProviderHasPreview."));
    }

  }
}

+ (BOOL)attachmentTypeRepresentsAnImage:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLAttachment identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SLAttachment type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttachment payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttachment previewImage](self, "previewImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SLAttachment downsampleStatus](self, "downsampleStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttachment payloadSourceFileURL](self, "payloadSourceFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("attachment %p { \n\t identifier=%@,\n\t type=%@,\n\t payload=%p,\n\t previewImage=%@,\n\t downsampleStatus=%@,\n\t payloadSourceFileURL=%@,\n"), self, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)previewType
{
  return self->_previewType;
}

- (void)setPreviewType:(int64_t)a3
{
  self->_previewType = a3;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)payload
{
  return self->_payload;
}

- (NSURL)payloadSourceFileURL
{
  return self->_payloadSourceFileURL;
}

- (void)setPayloadSourceFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)itemProviderPreviewType
{
  return self->_itemProviderPreviewType;
}

- (int64_t)downsampleStatus
{
  return self->_downsampleStatus;
}

- (void)setDownsampleStatus:(int64_t)a3
{
  self->_downsampleStatus = a3;
}

- (BOOL)startedPayloadLoad
{
  return self->_startedPayloadLoad;
}

- (void)setStartedPayloadLoad:(BOOL)a3
{
  self->_startedPayloadLoad = a3;
}

- (BOOL)needsAnotherPreviewGeneration
{
  return self->_needsAnotherPreviewGeneration;
}

- (void)setNeedsAnotherPreviewGeneration:(BOOL)a3
{
  self->_needsAnotherPreviewGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_payloadSourceFileURL, 0);
  objc_storeStrong(&self->_payload, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_payloadUpdateObserver, 0);
  objc_storeStrong(&self->_previewUpdateObserver, 0);
}

@end

@implementation _INDataImage

- (_INDataImage)initWithImageData:(id)a3
{
  id v5;
  id *v6;
  _INDataImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_INDataImage;
  v6 = -[INImage _initWithIdentifier:](&v9, sel__initWithIdentifier_, 0);
  v7 = (_INDataImage *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 9, a3);
    v7->_hashLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSData *imageData;
  uint64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_INDataImage;
  if (-[INImage isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    imageData = self->_imageData;
    v7 = v5[9];
    if (imageData)
    {
      if (v7 && (-[NSData isEqual:](imageData, "isEqual:") & 1) != 0)
        goto LABEL_5;
    }
    else if (!v7)
    {
LABEL_5:
      v8 = 1;
LABEL_9:

      goto LABEL_10;
    }
    v8 = 0;
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)_requiresRetrieval
{
  void *v2;
  BOOL v3;

  -[_INDataImage imageData](self, "imageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)_retrieveImageDataWithReply:(id)a3
{
  if (a3)
    (*((void (**)(id, _INDataImage *, _QWORD))a3 + 2))(a3, self, 0);
}

- (id)_identifier
{
  void *v2;
  void *v3;

  -[_INDataImage _sha256HashUUID](self, "_sha256HashUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[NSData length](self->_imageData, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("data length: %tu"), -[NSData length](self->_imageData, "length"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)_INDataImage;
  -[INImage _dictionaryRepresentation](&v9, sel__dictionaryRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v10 = CFSTR("imageData");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  if (!v3)
  return v5;
}

- (id)_copyWithSubclass:(Class)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_INDataImage;
  v4 = -[INImage _copyWithSubclass:](&v10, sel__copyWithSubclass_, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_INDataImage imageData](self, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setImageData:", v6);

  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v7 = v5;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (void)_setImageData:(id)a3
{
  NSData *v5;
  NSUUID *sha256HashUUID;
  NSData *v7;

  v5 = (NSData *)a3;
  if (self->_imageData != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_imageData, a3);
    os_unfair_lock_lock(&self->_hashLock);
    sha256HashUUID = self->_sha256HashUUID;
    self->_sha256HashUUID = 0;

    os_unfair_lock_unlock(&self->_hashLock);
    v5 = v7;
  }

}

- (BOOL)_isEligibleForProxying
{
  return 1;
}

- (id)_sha256HashUUID
{
  os_unfair_lock_s *p_hashLock;
  NSUUID *sha256HashUUID;
  id v5;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  unsigned __int8 md[32];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_hashLock = &self->_hashLock;
  os_unfair_lock_lock(&self->_hashLock);
  sha256HashUUID = self->_sha256HashUUID;
  if (!sha256HashUUID)
  {
    -[_INDataImage imageData](self, "imageData");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA256((const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), md);
    v6 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", md);
    v7 = self->_sha256HashUUID;
    self->_sha256HashUUID = v6;

    sha256HashUUID = self->_sha256HashUUID;
  }
  v8 = sha256HashUUID;
  os_unfair_lock_unlock(p_hashLock);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_INDataImage;
  v4 = a3;
  -[INImage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageData, CFSTR("imageData"), v5.receiver, v5.super_class);

}

- (_INDataImage)initWithCoder:(id)a3
{
  id v4;
  _INDataImage *v5;
  uint64_t v6;
  NSData *imageData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_INDataImage;
  v5 = -[INImage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v6;

    v5->_hashLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_sha256HashUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[_INDataImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s Attempting data image loading strategy with helper: %@", buf, 0x16u);
      }
      -[_INDataImage imageData](self, "imageData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __98___INDataImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke;
      v14[3] = &unk_1E228FDC0;
      v14[4] = self;
      v15 = v10;
      objc_msgSend(v8, "loadImageSizeFromData:completion:", v12, v14);

    }
    else
    {
      -[_INDataImage imageData](self, "imageData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, _QWORD, double, double))v10 + 2))(v10, v13, 0, 0, 0.0, 0.0);

    }
  }

}

@end

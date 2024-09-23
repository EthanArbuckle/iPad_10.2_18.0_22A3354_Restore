@implementation RESharedTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RESharedTexturePayload)initWithTexture:(id)a3 isLimitedRenderAsset:(BOOL)a4 semantic:(unint64_t)a5 colorSpace:(id)a6
{
  id v10;
  id v11;
  RESharedTexturePayload *v12;
  uint64_t v13;
  MTLSharedTextureHandle *handle;
  re *v15;
  RESharedTexturePayload *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RESharedTexturePayload;
  v12 = -[RESharedResourcePayload init](&v19, sel_init);
  if (v12
    && (v13 = objc_msgSend(v10, "newSharedTextureHandle"),
        handle = v12->_handle,
        v12->_handle = (MTLSharedTextureHandle *)v13,
        handle,
        v12->_isLimitedRenderAsset = a4,
        v12->_semantic = a5,
        objc_storeStrong((id *)&v12->_colorSpace, a6),
        !v12->_handle))
  {
    v17 = *re::assetTypesLogObjects(v15);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_fault_impl(&dword_224FE9000, v17, OS_LOG_TYPE_FAULT, "Failed to create shared texture handle for %@", buf, 0xCu);
    }
    v16 = 0;
  }
  else
  {
    v16 = v12;
  }

  return v16;
}

- (RESharedTexturePayload)initWithCoder:(id)a3
{
  id v4;
  RESharedTexturePayload *v5;
  uint64_t v6;
  MTLSharedTextureHandle *handle;
  uint64_t v8;
  NSString *colorSpace;
  re *v10;
  RESharedTexturePayload *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  RESharedTexturePayload *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RESharedTexturePayload;
  v5 = -[RESharedResourcePayload initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
  v6 = objc_claimAutoreleasedReturnValue();
  handle = v5->_handle;
  v5->_handle = (MTLSharedTextureHandle *)v6;

  v5->_isLimitedRenderAsset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLimitedRenderAsset"));
  v5->_semantic = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("semantic"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorSpace"));
  v8 = objc_claimAutoreleasedReturnValue();
  colorSpace = v5->_colorSpace;
  v5->_colorSpace = (NSString *)v8;

  if (!v5->_handle)
  {
    v12 = *re::assetTypesLogObjects(v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_fault_impl(&dword_224FE9000, v12, OS_LOG_TYPE_FAULT, "Failed to decode shared texture handle for %@", buf, 0xCu);
    }
    v11 = 0;
  }
  else
  {
LABEL_3:
    v11 = v5;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_handle, CFSTR("handle"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isLimitedRenderAsset, CFSTR("isLimitedRenderAsset"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_semantic, CFSTR("semantic"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_colorSpace, CFSTR("colorSpace"));

}

- (BOOL)hasSameUnderlyingIOSurface:(id)a3
{
  RESharedTexturePayload *v4;
  id *p_isa;
  MTLSharedTextureHandle *handle;
  BOOL v7;

  v4 = (RESharedTexturePayload *)a3;
  p_isa = (id *)&v4->super.super.isa;
  if (v4)
    v7 = self == v4
      || (handle = self->_handle, handle == p_isa[3])
      || CFEqual((CFTypeRef)-[MTLSharedTextureHandle ioSurface](handle, "ioSurface"), (CFTypeRef)objc_msgSend(p_isa[3], "ioSurface")) != 0;
  else
    v7 = 0;

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t ID;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  ID = IOSurfaceGetID((IOSurfaceRef)-[MTLSharedTextureHandle ioSurface](self->_handle, "ioSurface"));
  -[MTLSharedTextureHandle label](self->_handle, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<RESharedTexturePayload: %p, IOSurface id: %u, label: '%@'>"), self, ID, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<RESharedTexturePayload: %p, IOSurface id: %u>"), self, IOSurfaceGetID((IOSurfaceRef)-[MTLSharedTextureHandle ioSurface](self->_handle, "ioSurface")));
}

- (MTLSharedTextureHandle)handle
{
  return self->_handle;
}

- (BOOL)isLimitedRenderAsset
{
  return self->_isLimitedRenderAsset;
}

- (unint64_t)semantic
{
  return self->_semantic;
}

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end

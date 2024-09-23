@implementation REIOSurfaceTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REIOSurfaceTexturePayload)initWithIOSurface:(id)a3 plane:(unint64_t)a4 pixelFormat:(unint64_t)a5
{
  id v9;
  REIOSurfaceTexturePayload *v10;
  REIOSurfaceTexturePayload *v11;
  id *p_ioSurface;
  re *v13;
  BOOL v14;
  REIOSurfaceTexturePayload *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  unint64_t planeIndex;
  objc_super v23;
  uint8_t buf[4];
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v23.receiver = self;
  v23.super_class = (Class)REIOSurfaceTexturePayload;
  v10 = -[RESharedResourcePayload init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    p_ioSurface = (id *)&v10->_ioSurface;
    objc_storeStrong((id *)&v10->_ioSurface, a3);
    v11->_planeIndex = a4;
    v11->_pixelFormat = a5;
    if (*p_ioSurface)
    {
      v13 = (re *)objc_msgSend(*p_ioSurface, "planeCount");
      v14 = a4 == 0;
      if (v13)
        v14 = (unint64_t)v13 > a4;
      if (v14)
        goto LABEL_6;
      v20 = *re::assetTypesLogObjects(v13);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        v15 = 0;
        goto LABEL_11;
      }
      planeIndex = v11->_planeIndex;
      *(_DWORD *)buf = 134217984;
      v25 = planeIndex;
      v17 = "Invalid plane index %lu when decoding REIOSurfaceTexturePayload";
      v18 = v20;
      v19 = 12;
    }
    else
    {
      v16 = *re::assetTypesLogObjects(0);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v17 = "Expected IOSurface to be non-nil";
      v18 = v16;
      v19 = 2;
    }
    _os_log_fault_impl(&dword_224FE9000, v18, OS_LOG_TYPE_FAULT, v17, buf, v19);
    goto LABEL_10;
  }
LABEL_6:
  v15 = v11;
LABEL_11:

  return v15;
}

- (REIOSurfaceTexturePayload)initWithCoder:(id)a3
{
  id v4;
  REIOSurfaceTexturePayload *v5;
  uint64_t v6;
  IOSurface *ioSurface;
  IOSurface *v8;
  unint64_t planeIndex;
  re *v10;
  BOOL v11;
  REIOSurfaceTexturePayload *v12;
  NSObject *v13;
  const char *v14;
  unint64_t v16;
  objc_super v17;
  uint8_t buf[4];
  REIOSurfaceTexturePayload *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)REIOSurfaceTexturePayload;
  v5 = -[RESharedResourcePayload initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ioSurface"));
    v6 = objc_claimAutoreleasedReturnValue();
    ioSurface = v5->_ioSurface;
    v5->_ioSurface = (IOSurface *)v6;

    v5->_planeIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("planeIndex"));
    v5->_pixelFormat = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pixelFormat"));
    v8 = v5->_ioSurface;
    if (v8)
    {
      planeIndex = v5->_planeIndex;
      v10 = -[IOSurface planeCount](v8, "planeCount");
      v11 = planeIndex == 0;
      if (v10)
        v11 = (unint64_t)v10 > planeIndex;
      if (v11)
        goto LABEL_6;
      v13 = *re::assetTypesLogObjects(v10);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        v12 = 0;
        goto LABEL_11;
      }
      v16 = v5->_planeIndex;
      *(_DWORD *)buf = 134217984;
      v19 = (REIOSurfaceTexturePayload *)v16;
      v14 = "Invalid plane index %lu when decoding REIOSurfaceTexturePayload";
    }
    else
    {
      v13 = *re::assetTypesLogObjects(0);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        goto LABEL_10;
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      v14 = "Failed to decode IOSurface reference for %@";
    }
    _os_log_fault_impl(&dword_224FE9000, v13, OS_LOG_TYPE_FAULT, v14, buf, 0xCu);
    goto LABEL_10;
  }
LABEL_6:
  v12 = v5;
LABEL_11:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_ioSurface, CFSTR("ioSurface"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_planeIndex, CFSTR("planeIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_pixelFormat, CFSTR("pixelFormat"));

}

- (BOOL)hasSameUnderlyingIOSurface:(id)a3
{
  REIOSurfaceTexturePayload *v4;
  REIOSurfaceTexturePayload *v5;
  IOSurface *ioSurface;
  IOSurface *v7;
  BOOL v8;

  v4 = (REIOSurfaceTexturePayload *)a3;
  v5 = v4;
  if (v4)
    v8 = self == v4
      || (ioSurface = self->_ioSurface, v7 = v5->_ioSurface, ioSurface == v7)
      || CFEqual(ioSurface, v7) != 0;
  else
    v8 = 0;

  return v8;
}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<REIOSurfaceTexturePayload: %p, IOSurface id: %u>"), self, IOSurfaceGetID((IOSurfaceRef)self->_ioSurface));
}

- (IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (unint64_t)planeIndex
{
  return self->_planeIndex;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioSurface, 0);
}

@end

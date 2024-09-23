@implementation REDrawableQueueTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REDrawableQueueTexturePayload)initWithDrawableQueue:(id)a3 placeholderTexture:(id)a4
{
  id v7;
  id v8;
  REDrawableQueueTexturePayload *v9;
  id *p_isa;
  REDrawableQueuePayload **p_drawableQueue;
  re *v12;
  REDrawableQueueTexturePayload *v13;
  NSObject *v14;
  uint8_t v16[16];
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)REDrawableQueueTexturePayload;
  v9 = -[RESharedResourcePayload init](&v17, sel_init);
  p_isa = (id *)&v9->super.super.isa;
  if (v9
    && (p_drawableQueue = &v9->_drawableQueue,
        objc_storeStrong((id *)&v9->_drawableQueue, a3),
        objc_storeStrong(p_isa + 3, a4),
        !*p_drawableQueue))
  {
    v14 = *re::assetTypesLogObjects(v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_fault_impl(&dword_224FE9000, v14, OS_LOG_TYPE_FAULT, "Expected DrawableQueue payload to be non-nil", v16, 2u);
    }
    v13 = 0;
  }
  else
  {
    v13 = p_isa;
  }

  return v13;
}

- (REDrawableQueueTexturePayload)initWithCoder:(id)a3
{
  id v4;
  REDrawableQueueTexturePayload *v5;
  uint64_t v6;
  REDrawableQueuePayload *drawableQueue;
  re *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  RESharedResourcePayload *placeholderTexture;
  REDrawableQueueTexturePayload *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  REDrawableQueueTexturePayload *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)REDrawableQueueTexturePayload;
  v5 = -[RESharedResourcePayload initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("drawableQueue"));
  v6 = objc_claimAutoreleasedReturnValue();
  drawableQueue = v5->_drawableQueue;
  v5->_drawableQueue = (REDrawableQueuePayload *)v6;

  if (v5->_drawableQueue)
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("placeholderTexture"));
    v13 = objc_claimAutoreleasedReturnValue();
    placeholderTexture = v5->_placeholderTexture;
    v5->_placeholderTexture = (RESharedResourcePayload *)v13;

LABEL_4:
    v15 = v5;
    goto LABEL_8;
  }
  v16 = *re::assetTypesLogObjects(v8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_fault_impl(&dword_224FE9000, v16, OS_LOG_TYPE_FAULT, "Failed to decode DrawableQueue object for %@", buf, 0xCu);
  }
  v15 = 0;
LABEL_8:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_drawableQueue, CFSTR("drawableQueue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_placeholderTexture, CFSTR("placeholderTexture"));

}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<REDrawableQueueTexturePayload: %p>"), self);
}

- (REDrawableQueuePayload)drawableQueue
{
  return self->_drawableQueue;
}

- (RESharedResourcePayload)placeholderTexture
{
  return self->_placeholderTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderTexture, 0);
  objc_storeStrong((id *)&self->_drawableQueue, 0);
}

@end

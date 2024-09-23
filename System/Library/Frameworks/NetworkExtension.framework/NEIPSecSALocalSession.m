@implementation NEIPSecSALocalSession

- (NEIPSecSALocalSession)initWithName:(id)a3 delegate:(id)a4
{
  NEIPSecSALocalSession *v4;
  NEIPSecSALocalSession *v5;
  NEIPSecSALocalSession *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIPSecSALocalSession;
  v4 = -[NEIPSecSASession initWithName:delegate:](&v10, sel_initWithName_delegate_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[super initWithName:delegate] failed", v9, 2u);
    }

  }
  return v5;
}

- (id)description
{
  id v3;
  unint64_t uniqueIndex;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
    uniqueIndex = self->super._uniqueIndex;
  else
    uniqueIndex = 0;
  -[NEIPSecSASession name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("LocalSASession[%llu, %@]"), uniqueIndex, v5);

  return v6;
}

- (BOOL)addLarvalSA:(id)a3
{
  _DWORD *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint32_t v8;
  const char *v9;
  id Property;
  int v12;
  NEIPSecSALocalSession *v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "spi");
  if (v5)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = self;
      v14 = 1024;
      v15 = bswap32(objc_msgSend(v4, "spi"));
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "%@ SPI is not 0, it is %X", (uint8_t *)&v12, 0x12u);
    }

    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v12) = 0;
      _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "SPI is not 0", (uint8_t *)&v12, 2u);
    }

  }
  else
  {
    v8 = arc4random();
    if (v4)
      v4[5] = v8;
    if (self)
      Property = objc_getProperty(self, v9, 32, 1);
    else
      Property = 0;
    objc_msgSend(Property, "addObject:", v4);
  }

  return v5 == 0;
}

@end

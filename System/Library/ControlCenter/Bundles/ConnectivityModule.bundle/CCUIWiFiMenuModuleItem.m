@implementation CCUIWiFiMenuModuleItem

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CCUIWiFiMenuModuleItem;
  if (-[CCUIMenuModuleItem isEqual:](&v21, sel_isEqual_, v4))
  {
    v5 = v4;
    objc_msgSend_isHotspot(self, v6, v7);
    objc_msgSend_isHotspot(v5, v8, v9);
    if (BSEqualBools()
      && (objc_msgSend_isSecure(self, v10, v11), objc_msgSend_isSecure(v5, v12, v13), BSEqualBools()))
    {
      v16 = objc_msgSend_signalBars(self, v14, v15);
      v19 = v16 == objc_msgSend_signalBars(v5, v17, v18);
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t isHotspot;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t isSecure;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  objc_super v27;

  objc_msgSend_builder(MEMORY[0x24BE0BE28], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)CCUIWiFiMenuModuleItem;
  v5 = -[CCUIMenuModuleItem hash](&v27, sel_hash);
  v7 = (id)objc_msgSend_appendUnsignedInteger_(v4, v6, (uint64_t)v5);
  isHotspot = objc_msgSend_isHotspot(self, v8, v9);
  v12 = (id)objc_msgSend_appendBool_(v4, v11, isHotspot);
  isSecure = objc_msgSend_isSecure(self, v13, v14);
  v17 = (id)objc_msgSend_appendBool_(v4, v16, isSecure);
  v20 = objc_msgSend_signalBars(self, v18, v19);
  v22 = (id)objc_msgSend_appendUnsignedInteger_(v4, v21, v20);
  v25 = objc_msgSend_hash(v4, v23, v24);

  return v25;
}

- (BOOL)isHotspot
{
  return self->_hotspot;
}

- (void)setHotspot:(BOOL)a3
{
  self->_hotspot = a3;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (unint64_t)signalBars
{
  return self->_signalBars;
}

- (void)setSignalBars:(unint64_t)a3
{
  self->_signalBars = a3;
}

@end

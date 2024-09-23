@implementation _WKFeature

- (unint64_t)status
{
  if (self->_wrappedFeature.data.__lx[40] - 1 < 7)
    return (self->_wrappedFeature.data.__lx[40] - 1) + 1;
  else
    return 0;
}

- (NSString)key
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)&self->_wrappedFeature.data.__lx[24];
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (Object)_apiObject
{
  return (Object *)&self->_wrappedFeature;
}

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::Feature::~Feature((API::Feature *)&self->_wrappedFeature, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKFeature;
    -[_WKFeature dealloc](&v5, sel_dealloc);
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  _BOOL4 v8;
  const char *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[_WKFeature name](self, "name");
  v7 = -[_WKFeature key](self, "key");
  v8 = -[_WKFeature defaultValue](self, "defaultValue");
  v9 = "off";
  if (v8)
    v9 = "on";
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = %@; key = %@; defaultValue = %s >"),
                       v5,
                       self,
                       v6,
                       v7,
                       v9);
}

- (NSString)name
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)&self->_wrappedFeature.data.__lx[16];
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (unint64_t)category
{
  unsigned int v2;

  v2 = self->_wrappedFeature.data.__lx[41] - 1;
  if (v2 > 8)
    return 0;
  else
    return qword_1978CF820[(char)v2];
}

- (NSString)details
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)&self->_wrappedFeature.data.__lx[32];
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (BOOL)defaultValue
{
  return self->_wrappedFeature.data.__lx[42];
}

- (BOOL)isHidden
{
  return self->_wrappedFeature.data.__lx[43];
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKFeature;
  if (-[_WKFeature isKindOfClass:](&v5, sel_isKindOfClass_)
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

@end

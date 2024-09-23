@implementation _WKWebExtensionDataRecord

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
    _objc_deallocOnMainThreadHelper();
  else
    dispatch_async_f(MEMORY[0x1E0C80D38], self, (dispatch_function_t)MEMORY[0x1E0DE7980]);
}

- (void)dealloc
{
  objc_super v3;

  (**(void (***)(ObjectStorage<WebKit::WebExtensionDataRecord> *, SEL))self->_webExtensionDataRecord.data.__lx)(&self->_webExtensionDataRecord, a2);
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionDataRecord;
  -[_WKWebExtensionDataRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _WKWebExtensionDataRecord *v4;
  const WTF::StringImpl *v5;
  void *v6;
  char v7;

  v4 = (_WKWebExtensionDataRecord *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    WTF::dynamic_objc_cast<_WKWebExtensionDataRecord>(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = WebKit::WebExtensionDataRecord::operator==((uint64_t)&self->_webExtensionDataRecord, (uint64_t)v6 + 8, v5);
    else
      v7 = 0;

  }
  return v7;
}

- (NSString)displayName
{
  __CFString *v2;

  if (*(_QWORD *)&self->_webExtensionDataRecord.data.__lx[16])
    v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v2 = &stru_1E351F1B8;
  return (NSString *)v2;
}

- (NSString)uniqueIdentifier
{
  __CFString *v2;

  if (*(_QWORD *)&self->_webExtensionDataRecord.data.__lx[24])
    v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v2 = &stru_1E351F1B8;
  return (NSString *)v2;
}

- (NSSet)dataTypes
{
  char v2;

  v2 = WebKit::WebExtensionDataRecord::types((WebKit::WebExtensionDataRecord *)&self->_webExtensionDataRecord);
  return (NSSet *)WebKit::toAPI(v2);
}

- (unint64_t)totalSize
{
  return WebKit::WebExtensionDataRecord::totalSize((WebKit::WebExtensionDataRecord *)&self->_webExtensionDataRecord);
}

- (unint64_t)sizeOfDataTypes:(id)a3
{
  WebKit *v4;
  NSSet *v5;
  unsigned __int8 v6;
  unint64_t v7;

  v4 = (WebKit *)a3;
  v6 = WebKit::toWebExtensionDataTypes(v4, v5);
  v7 = WebKit::WebExtensionDataRecord::sizeOfTypes((uint64_t)&self->_webExtensionDataRecord, v6);

  return v7;
}

- (NSArray)errors
{
  return (NSArray *)WebKit::WebExtensionDataRecord::errors((id *)&self->_webExtensionDataRecord);
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionDataRecord;
}

- (void)_webExtensionDataRecord
{
  return &self->_webExtensionDataRecord;
}

@end

@implementation CUINamedLookup

- (id)_renditionForSpecificKey:(id)a3
{
  return objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "renditionWithKey:usingKeySignature:", objc_msgSend(a3, "keyList"), self->_signature);
}

- (unint64_t)hash
{
  return LOWORD(self->_storageRef) | (-[NSString hash](self->_signature, "hash") << 16);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (CUIThemeRendition)_rendition
{
  return (CUIThemeRendition *)-[CUINamedLookup _renditionForSpecificKey:](self, "_renditionForSpecificKey:", self->_key);
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (unint64_t)storageRef
{
  return self->_storageRef;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_self(CUINamedLookup, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0 && *((_QWORD *)a3 + 4) == self->_storageRef)
    return objc_msgSend(*((id *)a3 + 3), "isEqualToString:", self->_signature);
  else
    return 0;
}

- (void)setRepresentsOnDemandContent:(BOOL)a3
{
  *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xFE | a3;
}

- (NSString)appearance
{
  void *v3;
  NSString *v4;

  v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  v4 = (NSString *)objc_msgSend(v3, "nameForAppearanceIdentifier:", (unsigned __int16)-[CUIRenditionKey themeAppearance](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeAppearance"));
  if (-[NSString length](v4, "length"))
    return v4;
  else
    return (NSString *)objc_msgSend(v3, "defaultAppearanceName");
}

- (int64_t)layoutDirection
{
  return -[CUIRenditionKey themeDirection](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeDirection");
}

- (CUINamedLookup)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedLookup *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CUINamedLookup;
  v8 = -[CUINamedLookup init](&v16, sel_init);
  if (v8)
  {
    v8->_name = (NSString *)objc_msgSend(a3, "copy");
    v8->_key = (CUIRenditionKey *)objc_msgSend(a4, "copy");
    v8->_storageRef = a5;
    if (-[CUINamedLookup _cacheRenditionProperties](v8, "_cacheRenditionProperties"))
    {
      v8->_lock._os_unfair_lock_opaque = 0;
    }
    else
    {
      -[CUINamedLookup key](v8, "key");
      _CUILog(4, (uint64_t)"CoreUI: unable to locate asset '%@' key:%@ releasing", v9, v10, v11, v12, v13, v14, (uint64_t)a3);

      return 0;
    }
  }
  return v8;
}

- (BOOL)_cacheRenditionProperties
{
  void *v3;

  v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  self->_signature = (NSString *)objc_msgSend(v3, "copyLookupKeySignatureForKey:", -[CUIRenditionKey keyList](self->_key, "keyList"));
  self->_distilledInVersion = objc_msgSend(v3, "distilledInCoreUIVersion");
  return 1;
}

- (unsigned)_distilledInVersion
{
  return self->_distilledInVersion;
}

- (int64_t)appearanceIdentifier
{
  return -[CUIRenditionKey themeAppearance](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeAppearance");
}

- (int64_t)localization
{
  return -[CUIRenditionKey themeLocalization](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeLocalization");
}

- (CUIRenditionKey)renditionKey
{
  return self->_key;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)keySignature
{
  return self->_signature;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUINamedLookup;
  -[CUINamedLookup dealloc](&v3, sel_dealloc);
}

- (NSString)renditionName
{
  return (NSString *)-[CUIThemeRendition name](-[CUINamedLookup _rendition](self, "_rendition"), "name");
}

- (BOOL)representsOnDemandContent
{
  return *((_BYTE *)self + 48) & 1;
}

- (BOOL)isTintable
{
  return -[CUIThemeRendition isTintable](-[CUINamedLookup _rendition](self, "_rendition"), "isTintable");
}

- (int64_t)idiom
{
  return CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIRenditionKey keyList](-[CUINamedLookup renditionKey](self, "renditionKey"), "keyList"), 15);
}

- (unint64_t)subtype
{
  return CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIRenditionKey keyList](-[CUINamedLookup renditionKey](self, "renditionKey"), "keyList"), 16);
}

- (int64_t)sizeClassHorizontal
{
  return CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIRenditionKey keyList](-[CUINamedLookup renditionKey](self, "renditionKey"), "keyList"), 20);
}

- (int64_t)sizeClassVertical
{
  return CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIRenditionKey keyList](-[CUINamedLookup renditionKey](self, "renditionKey"), "keyList"), 21);
}

- (int64_t)memoryClass
{
  return -[CUIRenditionKey themeMemoryClass](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeMemoryClass");
}

- (int64_t)graphicsClass
{
  return -[CUIRenditionKey themeGraphicsClass](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeGraphicsClass");
}

- (int64_t)displayGamut
{
  return -[CUIRenditionKey themeDisplayGamut](-[CUINamedLookup renditionKey](self, "renditionKey"), "themeDisplayGamut");
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CUIRenditionKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setStorageRef:(unint64_t)a3
{
  self->_storageRef = a3;
}

@end

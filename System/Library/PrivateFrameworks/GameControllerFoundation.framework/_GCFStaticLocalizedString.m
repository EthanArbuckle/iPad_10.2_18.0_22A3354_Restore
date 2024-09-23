@implementation _GCFStaticLocalizedString

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)alloc
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCFStaticLocalizedString;
  -[_GCFStaticLocalizedString dealloc](&v3, sel_dealloc);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (_GCFStaticLocalizedString)initWithCoder:(id)a3
{
  objc_super v6;

  -[_GCFStaticLocalizedString doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v6.receiver = self;
  v6.super_class = (Class)_GCFStaticLocalizedString;
  return -[GCFLocalizedString initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  int v5;
  NSString *key;

  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  key = self->_key;
  if (v5)
  {
    objc_msgSend(a3, "encodeObject:forKey:", key, CFSTR("key"));
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(-[_GCFStaticLocalizedString bundle](self, "bundle"), "bundleURL"), CFSTR("bundle"));
    objc_msgSend(a3, "encodeObject:forKey:", -[_GCFStaticLocalizedString table](self, "table"), CFSTR("table"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", key);
    objc_msgSend(a3, "encodeObject:", objc_msgSend(-[_GCFStaticLocalizedString bundle](self, "bundle"), "bundleURL"));
    objc_msgSend(a3, "encodeObject:", -[_GCFStaticLocalizedString table](self, "table"));
  }
}

- (id)_realizedString
{
  NSString *realizedString;

  realizedString = self->__realizedString;
  if (!realizedString)
  {
    objc_sync_enter(self);
    realizedString = self->__realizedString;
    if (!realizedString)
    {
      realizedString = (NSString *)objc_msgSend(-[_GCFStaticLocalizedString bundle](self, "bundle"), "localizedStringForKey:value:table:", self->_key, 0, -[_GCFStaticLocalizedString table](self, "table"));
      self->__realizedString = (NSString *)-[NSString copy](realizedString, "copy");
    }
    objc_sync_exit(self);
  }
  return realizedString;
}

- (id)key
{
  return self->_key;
}

- (id)bundle
{
  return +[NSBundle GameControllerFoundationBundle](NSBundle_0, "GameControllerFoundationBundle");
}

- (id)table
{
  return CFSTR("Localizable");
}

@end

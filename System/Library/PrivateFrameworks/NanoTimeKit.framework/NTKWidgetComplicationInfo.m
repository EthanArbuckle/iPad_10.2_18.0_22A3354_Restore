@implementation NTKWidgetComplicationInfo

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKWidgetComplicationInfo;
  return -[NTKWidgetComplicationInfo init](&v3, sel_init);
}

- (NTKWidgetComplicationInfo)initWithAppName:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  NTKWidgetComplicationInfo *v8;
  uint64_t v9;
  NSString *localizedAppName;
  uint64_t v11;
  NSString *localizedDisplayName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKWidgetComplicationInfo;
  v8 = -[NTKWidgetComplicationInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    localizedAppName = v8->_localizedAppName;
    v8->_localizedAppName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    localizedDisplayName = v8->_localizedDisplayName;
    v8->_localizedDisplayName = (NSString *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = -[NTKWidgetComplicationInfo _init]([NTKWidgetComplicationInfo alloc], "_init");
  objc_storeStrong(v4 + 2, self->_localizedAppName);
  objc_storeStrong(v4 + 1, self->_localizedDisplayName);
  return v4;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDisplayName, a3);
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedAppName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end

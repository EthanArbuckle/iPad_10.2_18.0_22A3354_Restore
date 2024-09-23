@implementation _HKRemoteDisplayTypeConfiguration

- (_HKRemoteDisplayTypeConfiguration)initWithInitialTimeScope:(int64_t)a3 remoteDisplayType:(id)a4
{
  id v7;
  _HKRemoteDisplayTypeConfiguration *v8;
  _HKRemoteDisplayTypeConfiguration *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HKRemoteDisplayTypeConfiguration;
  v8 = -[_HKRemoteDisplayTypeConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_initialTimeScope = a3;
    objc_storeStrong((id *)&v8->_remoteDisplayType, a4);
  }

  return v9;
}

- (int64_t)initialTimeScope
{
  return self->_initialTimeScope;
}

- (HKDisplayType)remoteDisplayType
{
  return self->_remoteDisplayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDisplayType, 0);
}

@end

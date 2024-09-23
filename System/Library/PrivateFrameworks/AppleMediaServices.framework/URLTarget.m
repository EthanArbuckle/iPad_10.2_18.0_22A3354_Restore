@implementation URLTarget

- (URLTarget)initWithBundle:(id)a3 scheme:(id)a4 secureScheme:(id)a5
{
  id v9;
  id v10;
  id v11;
  URLTarget *v12;
  URLTarget *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)URLTarget;
  v12 = -[URLTarget init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a3);
    objc_storeStrong((id *)&v13->_normalScheme, a4);
    objc_storeStrong((id *)&v13->_secureScheme, a5);
  }

  return v13;
}

+ (id)targetWithBundle:(id)a3 scheme:(id)a4 secureScheme:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundle:scheme:secureScheme:", v10, v9, v8);

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (int64_t)defaultIndex
{
  return self->_defaultIndex;
}

- (void)setDefaultIndex:(int64_t)a3
{
  self->_defaultIndex = a3;
}

- (NSString)normalScheme
{
  return self->_normalScheme;
}

- (void)setNormalScheme:(id)a3
{
  objc_storeStrong((id *)&self->_normalScheme, a3);
}

- (NSString)secureScheme
{
  return self->_secureScheme;
}

- (void)setSecureScheme:(id)a3
{
  objc_storeStrong((id *)&self->_secureScheme, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureScheme, 0);
  objc_storeStrong((id *)&self->_normalScheme, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end

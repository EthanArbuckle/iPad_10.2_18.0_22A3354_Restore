@implementation PHASETapInterfaceImpl

- (PHASETapInterfaceImpl)init
{
  -[PHASETapInterfaceImpl doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASETapInterfaceImpl)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASETapInterfaceImpl)initWithTapRegistry:(id)a3
{
  id v4;
  PHASETapInterfaceImpl *v5;
  PHASETapInterfaceImpl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHASETapInterfaceImpl;
  v5 = -[PHASETapInterfaceImpl init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_tapRegistry, v4);

  return v6;
}

- (PHASETapRegistry)tapRegistry
{
  return (PHASETapRegistry *)objc_loadWeakRetained((id *)&self->_tapRegistry);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapRegistry);
}

@end

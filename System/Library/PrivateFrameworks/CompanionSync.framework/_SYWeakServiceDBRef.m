@implementation _SYWeakServiceDBRef

- (_SYWeakServiceDBRef)initWithServiceName:(id)a3
{
  id v4;
  _SYWeakServiceDBRef *v5;
  uint64_t v6;
  NSString *name;
  _SYWeakServiceDBRef *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SYWeakServiceDBRef;
  v5 = -[_SYWeakServiceDBRef init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (_SYSharedServiceDB)db
{
  _SYSharedServiceDB **p_db;
  _SYSharedServiceDB *WeakRetained;
  _SYSharedServiceDB *v5;
  void *v6;

  p_db = &self->_db;
  WeakRetained = (_SYSharedServiceDB *)objc_loadWeakRetained((id *)&self->_db);
  if (!WeakRetained)
  {
    v5 = [_SYSharedServiceDB alloc];
    -[_SYWeakServiceDBRef name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = -[_SYSharedServiceDB initWithServiceName:](v5, "initWithServiceName:", v6);

    objc_storeWeak((id *)p_db, WeakRetained);
  }
  return WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDb:(id)a3
{
  objc_storeWeak((id *)&self->_db, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_db);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

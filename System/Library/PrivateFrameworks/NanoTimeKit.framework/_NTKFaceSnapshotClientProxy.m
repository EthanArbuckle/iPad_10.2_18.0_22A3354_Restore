@implementation _NTKFaceSnapshotClientProxy

- (_NTKFaceSnapshotClientProxy)initWithWeakProxy:(id)a3
{
  id v4;
  _NTKFaceSnapshotClientProxy *v5;
  _NTKFaceSnapshotClientProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NTKFaceSnapshotClientProxy;
  v5 = -[_NTKFaceSnapshotClientProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_proxy, v4);

  return v6;
}

- (void)faceSnapshotChangedForKey:(id)a3
{
  NTKFaceSnapshotClient **p_proxy;
  id v4;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "faceSnapshotChangedForKey:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxy);
}

@end

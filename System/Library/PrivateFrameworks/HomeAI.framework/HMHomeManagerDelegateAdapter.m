@implementation HMHomeManagerDelegateAdapter

- (void)homeManagerDidUpdateHomes:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[HMHomeManagerDelegateAdapter didUpdateHomes](self, "didUpdateHomes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMHomeManagerDelegateAdapter didUpdateHomes](self, "didUpdateHomes");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)didUpdateHomes
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setDidUpdateHomes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didUpdateHomes, 0);
}

@end

@implementation MRUCoordinatedUpdate

- (MRUCoordinatedUpdate)initWithUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MRUCoordinatedUpdate *v8;
  uint64_t v9;
  id update;
  uint64_t v11;
  id completion;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRUCoordinatedUpdate;
  v8 = -[MRUCoordinatedUpdate init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    update = v8->_update;
    v8->_update = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    completion = v8->_completion;
    v8->_completion = (id)v11;

  }
  return v8;
}

- (void)process
{
  void (**update)(void);

  update = (void (**)(void))self->_update;
  if (update)
    update[2]();
}

- (void)complete
{
  void (**completion)(void);

  completion = (void (**)(void))self->_completion;
  if (completion)
    completion[2]();
}

- (id)update
{
  return self->_update;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_update, 0);
}

@end

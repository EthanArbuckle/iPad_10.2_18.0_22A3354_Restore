@implementation CEKSequencedAnimation

- (CEKSequencedAnimation)initWithWithIdentifier:(id)a3 duration:(double)a4 updateHandler:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  CEKSequencedAnimation *v14;
  CEKSequencedAnimation *v15;
  void *v16;
  id updateHandler;
  void *v18;
  id completionHandler;
  CEKSequencedAnimation *v20;
  objc_super v22;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CEKSequencedAnimation;
  v14 = -[CEKSequencedAnimation init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    v15->_duration = a4;
    v16 = _Block_copy(v12);
    updateHandler = v15->_updateHandler;
    v15->_updateHandler = v16;

    v18 = _Block_copy(v13);
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = v18;

    v20 = v15;
  }

  return v15;
}

- (CEKSequencedAnimation)initWithWithIdentifier:(id)a3 duration:(double)a4 updateHandler:(id)a5
{
  return -[CEKSequencedAnimation initWithWithIdentifier:duration:updateHandler:completion:](self, "initWithWithIdentifier:duration:updateHandler:completion:", a3, a5, 0, a4);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)duration
{
  return self->_duration;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

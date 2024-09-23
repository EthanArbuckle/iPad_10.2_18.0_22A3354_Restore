@implementation _CNLazyArrayGeneratorSource

- (_CNLazyArrayGeneratorSource)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _CNLazyArrayGeneratorSource *v15;
  _CNLazyArrayGeneratorSource *v16;
  uint64_t v17;
  id condition;
  uint64_t v19;
  id nextState;
  uint64_t v21;
  id resultFromState;
  _CNLazyArrayGeneratorSource *v23;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_CNLazyArrayGeneratorSource;
  v15 = -[_CNLazyArrayGeneratorSource init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(&v15->_state, a3);
    v17 = objc_msgSend(v12, "copy");
    condition = v16->_condition;
    v16->_condition = (id)v17;

    v19 = objc_msgSend(v13, "copy");
    nextState = v16->_nextState;
    v16->_nextState = (id)v19;

    v21 = objc_msgSend(v14, "copy");
    resultFromState = v16->_resultFromState;
    v16->_resultFromState = (id)v21;

    v16->_firstTime = 1;
    v23 = v16;
  }

  return v16;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  id state;

  if (!self->_firstTime)
  {
    (*((void (**)(void))self->_nextState + 2))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    state = self->_state;
    self->_state = v4;

    if ((*((unsigned int (**)(void))self->_condition + 2))())
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3;
  }
  self->_firstTime = 0;
  if (((*((uint64_t (**)(void))self->_condition + 2))() & 1) == 0)
    goto LABEL_5;
LABEL_3:
  (*((void (**)(void))self->_resultFromState + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultFromState, 0);
  objc_storeStrong(&self->_nextState, 0);
  objc_storeStrong(&self->_condition, 0);
  objc_storeStrong(&self->_state, 0);
}

@end

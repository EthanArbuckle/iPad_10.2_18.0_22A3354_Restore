@implementation CUIKORContentImageRequest

- (int64_t)requestId
{
  return self->_requestId;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (CUIKOROccurrenceState)state
{
  return self->_state;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (unint64_t)options
{
  return self->_options;
}

- (CUIKORContentImageRequest)initWithId:(int64_t)a3 options:(unint64_t)a4 state:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  CUIKORContentImageRequest *v12;
  CUIKORContentImageRequest *v13;
  uint64_t v14;
  CUIKOROccurrenceState *state;
  uint64_t v16;
  id resultHandler;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CUIKORContentImageRequest;
  v12 = -[CUIKORContentImageRequest init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_requestId = a3;
    v12->_options = a4;
    v14 = objc_msgSend(v10, "copy");
    state = v13->_state;
    v13->_state = (CUIKOROccurrenceState *)v14;

    v16 = objc_msgSend(v11, "copy");
    resultHandler = v13->_resultHandler;
    v13->_resultHandler = (id)v16;

  }
  return v13;
}

@end

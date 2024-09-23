@implementation BSEventQueueEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_handler, 0);
}

+ (BSEventQueueEvent)eventWithName:(id)a3 handler:(id)a4
{
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSEventQueueEvent.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSEventQueueEvent.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

LABEL_3:
  v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    v9 = objc_msgSend(a3, "copy");
    v10 = (void *)v8[2];
    v8[2] = v9;

    v11 = objc_msgSend(a4, "copy");
    v12 = (void *)v8[1];
    v8[1] = v11;

  }
  return (BSEventQueueEvent *)v8;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, 0);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)execute
{
  void (**handler)(void);

  if (self)
  {
    handler = (void (**)(void))self->_handler;
    if (handler)
      handler[2]();
  }
}

@end

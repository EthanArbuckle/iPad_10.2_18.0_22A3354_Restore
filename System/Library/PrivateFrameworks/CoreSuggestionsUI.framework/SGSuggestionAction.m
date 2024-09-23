@implementation SGSuggestionAction

- (SGSuggestionAction)initWithTitle:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  SGSuggestionAction *v9;
  void *v10;
  id handler;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SGSuggestionAction;
  v9 = -[SGSuggestionAction init](&v13, sel_init);
  if (v9)
  {
    v10 = _Block_copy(v8);
    handler = v9->_handler;
    v9->_handler = v10;

    objc_storeStrong((id *)&v9->_title, a3);
  }

  return v9;
}

- (id)title
{
  return self->_title;
}

- (void)execute
{
  (*((void (**)(void))self->_handler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (SGSuggestionAction)actionWithTitle:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:handler:", v7, v6);

  return (SGSuggestionAction *)v8;
}

@end

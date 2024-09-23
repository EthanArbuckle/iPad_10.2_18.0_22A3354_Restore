@implementation ActivityPlus

- (ActivityPlus)initWithTitle:(id)a3 image:(id)a4 type:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ActivityPlus *v14;
  uint64_t v15;
  NSString *activityTitle;
  void *v17;
  id actionHandler;
  ActivityPlus *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ActivityPlus;
  v14 = -[UIActivity init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    activityTitle = v14->_activityTitle;
    v14->_activityTitle = (NSString *)v15;

    objc_storeStrong((id *)&v14->_activityImage, a4);
    objc_storeStrong((id *)&v14->_activityType, a5);
    v17 = _Block_copy(v13);
    actionHandler = v14->_actionHandler;
    v14->_actionHandler = v17;

    v19 = v14;
  }

  return v14;
}

- (void)performActivity
{
  void (**actionHandler)(void);
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ActivityPlus;
  -[UIActivity performActivity](&v4, sel_performActivity);
  actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler)
    actionHandler[2]();
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (id)activityTitle
{
  return self->_activityTitle;
}

- (id)activityImage
{
  return self->_activityImage;
}

- (id)activityType
{
  return self->_activityType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end

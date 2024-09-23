@implementation CNUIIDSIDQueryControllerWrapper

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[CNUIIDSIDQueryControllerWrapper controller](self, "controller");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v16, v15, v14, v13, v12);

  return v18;
}

- (IDSIDQueryController)controller
{
  return self->_controller;
}

- (CNUIIDSIDQueryControllerWrapper)initWithController:(id)a3
{
  id v5;
  CNUIIDSIDQueryControllerWrapper *v6;
  CNUIIDSIDQueryControllerWrapper *v7;
  CNUIIDSIDQueryControllerWrapper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIIDSIDQueryControllerWrapper;
  v6 = -[CNUIIDSIDQueryControllerWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end

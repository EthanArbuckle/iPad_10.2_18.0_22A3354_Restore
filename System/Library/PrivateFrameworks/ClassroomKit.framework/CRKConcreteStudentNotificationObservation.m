@implementation CRKConcreteStudentNotificationObservation

- (void)dealloc
{
  objc_super v3;

  -[CRKConcreteStudentNotificationObservation invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteStudentNotificationObservation;
  -[CRKConcreteStudentNotificationObservation dealloc](&v3, sel_dealloc);
}

- (CRKConcreteStudentNotificationObservation)initWithNotificationName:(id)a3 notificationHandler:(id)a4
{
  id v6;
  id v7;
  CRKConcreteStudentNotificationObservation *v8;
  uint64_t v9;
  NSString *notificationName;
  uint64_t v11;
  id notificationHandler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKConcreteStudentNotificationObservation;
  v8 = -[CRKConcreteStudentNotificationObservation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    notificationName = v8->_notificationName;
    v8->_notificationName = (NSString *)v9;

    v11 = MEMORY[0x219A226E8](v7);
    notificationHandler = v8->_notificationHandler;
    v8->_notificationHandler = (id)v11;

  }
  return v8;
}

- (void)receiveNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;

  v12 = a3;
  v6 = a4;
  -[CRKConcreteStudentNotificationObservation notificationHandler](self, "notificationHandler");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CRKConcreteStudentNotificationObservation notificationName](self, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v12);

    if (v10)
    {
      -[CRKConcreteStudentNotificationObservation notificationHandler](self, "notificationHandler");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v11)[2](v11, v6);

    }
  }

}

- (void)invalidate
{
  -[CRKConcreteStudentNotificationObservation setNotificationHandler:](self, "setNotificationHandler:", 0);
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (id)notificationHandler
{
  return self->_notificationHandler;
}

- (void)setNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationHandler, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end

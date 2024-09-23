@implementation CRXUNotificationHandler

- (CRXUNotificationHandler)initWithNotification:(id)a3 timeout:(double)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  CRXUNotificationHandler *v13;
  CRXUNotificationHandler *v14;
  uint64_t v15;
  id block;
  void *v17;
  uint64_t v18;
  CRXUTimer *timer;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CRXUNotificationHandler;
  v13 = -[CRXUNotificationHandler init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a5);
    v15 = objc_msgSend(v12, "copy");
    block = v14->_block;
    v14->_block = (id)v15;

    +[CRXUNotificationCenter sharedInstance](CRXUNotificationCenter, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:queue:name:", v14, sel_handleNotification_, v14->_queue, v10);

    +[CRXUTimer scheduledTimerWithTimeInterval:weakTarget:selector:repeats:queue:](CRXUTimer, "scheduledTimerWithTimeInterval:weakTarget:selector:repeats:queue:", v14, sel_handleTimer_, 0, v14->_queue, a4);
    v18 = objc_claimAutoreleasedReturnValue();
    timer = v14->_timer;
    v14->_timer = (CRXUTimer *)v18;

  }
  return v14;
}

- (void)handleNotification:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x23B83F660](self->_block, a2, a3);
  -[CRXUNotificationHandler invalidate](self, "invalidate");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    v4 = v5;
  }

}

- (void)handleTimer:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))MEMORY[0x23B83F660](self->_block, a2, a3);
  -[CRXUNotificationHandler invalidate](self, "invalidate");
  v4[2](v4, 0);

}

- (void)invalidate
{
  CRXUTimer *timer;
  void *v4;
  id block;

  -[CRXUTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  +[CRXUNotificationCenter sharedInstance](CRXUNotificationCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_notificationToken);

  block = self->_block;
  self->_block = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

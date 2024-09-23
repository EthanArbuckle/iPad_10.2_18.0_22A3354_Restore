@implementation CNKBackgroundSendUtility

- (CNKBackgroundSendUtility)initWithItemProvider:(id)a3 faceTimeConversation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNKBackgroundSendUtility *v11;
  uint64_t v12;
  SWBackgroundSendUtility *impl;
  CNKBackgroundSendUtility *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNKBackgroundSendUtility;
  v11 = -[CNKBackgroundSendUtility init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(NSClassFromString(CFSTR("SWBackgroundSendUtility"))), "initWithItemProvider:faceTimeConversation:queue:completion:", v8, v9, MEMORY[0x1E0C80D38], v10);
    impl = v11->_impl;
    v11->_impl = (SWBackgroundSendUtility *)v12;

    v14 = v11;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end

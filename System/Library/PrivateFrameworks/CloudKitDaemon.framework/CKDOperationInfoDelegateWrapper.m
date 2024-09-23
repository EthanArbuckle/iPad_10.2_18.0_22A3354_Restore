@implementation CKDOperationInfoDelegateWrapper

- (CKDOperationInfoDelegateWrapper)initWithDelegate:(id)a3
{
  id v4;
  CKDOperationInfoDelegateWrapper *v5;
  CKDOperationInfoDelegateWrapper *v6;
  uint64_t v7;
  NSString *personaID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDOperationInfoDelegateWrapper;
  v5 = -[CKDOperationInfoDelegateWrapper init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    CKCurrentPersonaID();
    v7 = objc_claimAutoreleasedReturnValue();
    personaID = v6->_personaID;
    v6->_personaID = (NSString *)v7;

  }
  return v6;
}

- (void)performWithDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BEBBBD8C;
  v6[3] = &unk_1E782F4D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  CKMuckingWithPersonas(v6);

}

- (CKDOperationInfoDelegate)delegate
{
  return (CKDOperationInfoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

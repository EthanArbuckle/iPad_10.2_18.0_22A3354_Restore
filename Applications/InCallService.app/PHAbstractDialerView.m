@implementation PHAbstractDialerView

- (void)dealloc
{
  objc_super v3;

  -[DialerLCDFieldProtocol setDelegate:](self->_lcdView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PHAbstractDialerView;
  -[PHAbstractDialerView dealloc](&v3, "dealloc");
}

- (void)dialerLCDFieldTextDidChange:(id)a3
{
  if (self->_lcdView == a3 && (objc_opt_respondsToSelector(self->_delegate, "dialerViewTextDidChange:") & 1) != 0)
    -[DialerViewDelegate dialerViewTextDidChange:](self->_delegate, "dialerViewTextDidChange:", self);
}

- (void)dialerField:(id)a3 stringWasPasted:(id)a4
{
  id v6;
  char v7;
  id v8;

  v6 = a4;
  if (self->_lcdView == a3)
  {
    v8 = v6;
    v7 = objc_opt_respondsToSelector(self->_delegate, "dialerView:stringWasPasted:");
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      -[DialerViewDelegate dialerView:stringWasPasted:](self->_delegate, "dialerView:stringWasPasted:", self, v8);
      v6 = v8;
    }
  }

}

- (id)senderIdentityMenuForDialerField:(id)a3 selectedSenderIdentity:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  if (self->_lcdView == a3
    && (objc_opt_respondsToSelector(self->_delegate, "senderIdentityMenuForDialerView:selectedSenderIdentity:") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DialerViewDelegate senderIdentityMenuForDialerView:selectedSenderIdentity:](self->_delegate, "senderIdentityMenuForDialerView:selectedSenderIdentity:", self, v6));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (DialerLCDFieldProtocol)lcdView
{
  return self->_lcdView;
}

- (void)setLcdView:(id)a3
{
  objc_storeStrong((id *)&self->_lcdView, a3);
}

- (TPDialerKeypadProtocol)phonePadView
{
  return self->_phonePadView;
}

- (void)setPhonePadView:(id)a3
{
  objc_storeStrong((id *)&self->_phonePadView, a3);
}

- (DialerViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (DialerViewDelegate *)a3;
}

- (UIControl)addContactButton
{
  return self->_addContactButton;
}

- (void)setAddContactButton:(id)a3
{
  objc_storeStrong((id *)&self->_addContactButton, a3);
}

- (UIControl)callButton
{
  return self->_callButton;
}

- (void)setCallButton:(id)a3
{
  objc_storeStrong((id *)&self->_callButton, a3);
}

- (UIControl)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (UIControl)searchButton
{
  return (UIControl *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSearchButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (UIControl)contactCountButton
{
  return (UIControl *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContactCountButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)isHostedInRemoteViewController
{
  return self->_isHostedInRemoteViewController;
}

- (void)setIsHostedInRemoteViewController:(BOOL)a3
{
  self->_isHostedInRemoteViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCountButton, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_callButton, 0);
  objc_storeStrong((id *)&self->_addContactButton, 0);
  objc_storeStrong((id *)&self->_phonePadView, 0);
  objc_storeStrong((id *)&self->_lcdView, 0);
}

@end

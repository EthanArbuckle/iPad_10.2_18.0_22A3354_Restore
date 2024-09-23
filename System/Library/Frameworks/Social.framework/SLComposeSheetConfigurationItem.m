@implementation SLComposeSheetConfigurationItem

- (SLComposeSheetConfigurationItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLComposeSheetConfigurationItem;
  return -[SLComposeSheetConfigurationItem init](&v3, sel_init);
}

- (void)setTitle:(NSString *)title
{
  id v4;

  objc_storeStrong((id *)&self->_title, title);
  -[SLComposeSheetConfigurationItem changeObserver](self, "changeObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationItemDidChange:", self);

}

- (void)setValue:(NSString *)value
{
  id v4;

  objc_storeStrong((id *)&self->_value, value);
  -[SLComposeSheetConfigurationItem changeObserver](self, "changeObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationItemDidChange:", self);

}

- (void)setValuePending:(BOOL)valuePending
{
  id v4;

  self->_valuePending = valuePending;
  -[SLComposeSheetConfigurationItem changeObserver](self, "changeObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationItemDidChange:", self);

}

- (id)changeObserver
{
  return objc_loadWeakRetained((id *)&self->_changeObserver);
}

- (void)setChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_changeObserver, a3);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)valuePending
{
  return self->_valuePending;
}

- (SLComposeSheetConfigurationItemTapHandler)tapHandler
{
  return self->_tapHandler;
}

- (void)setTapHandler:(SLComposeSheetConfigurationItemTapHandler)tapHandler
{
  objc_setProperty_nonatomic_copy(self, a2, tapHandler, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapHandler, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

@end

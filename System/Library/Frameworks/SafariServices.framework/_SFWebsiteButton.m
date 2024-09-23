@implementation _SFWebsiteButton

- (_SFWebsiteButton)init
{
  _SFWebsiteButton *v2;
  void *v3;
  void *v4;
  _SFWebsiteButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFWebsiteButton;
  v2 = -[_SFWebsiteButton init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebsiteButton setTintColor:](v2, "setTintColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("safari"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebsiteButton setImage:forState:](v2, "setImage:forState:", v4, 0);

    -[_SFWebsiteButton addTarget:action:forControlEvents:](v2, "addTarget:action:forControlEvents:", v2, sel__activate_, 64);
    -[_SFWebsiteButton sizeToFit](v2, "sizeToFit");
    v5 = v2;
  }

  return v2;
}

- (void)_activate:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[_SFWebsiteButton activationHandler](self, "activationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_SFWebsiteButton activationHandler](self, "activationHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activationHandler, 0);
}

@end

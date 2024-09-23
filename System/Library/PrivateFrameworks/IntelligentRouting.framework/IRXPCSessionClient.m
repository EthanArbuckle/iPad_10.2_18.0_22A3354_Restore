@implementation IRXPCSessionClient

- (IRXPCSessionClient)initWithDelegate:(id)a3
{
  id v4;
  IRXPCSessionClient *v5;
  IRXPCSessionClient *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IRXPCSessionClient;
  v5 = -[IRXPCSessionClient init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[IRXPCSessionClient setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (void)_didSpotOnLocationComplete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IRXPCSessionClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didSpotOnLocationComplete:", v4);

}

- (void)_didUpdateBundlesWithSignificantInteractionPattern:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IRXPCSessionClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didUpdateBundlesWithSignificantInteractionPattern:", v4);

}

- (void)_didUpdateContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IRXPCSessionClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didUpdateContext:", v4);

}

- (void)_sessionDidFailWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IRXPCSessionClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sessionDidFailWithError:", v4);

}

- (IRXPCSessionClient)delegate
{
  return (IRXPCSessionClient *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation PKHoverControllerDisplayLinkDelegate

- (void)display:(id)a3
{
  id v3;

  -[PKHoverControllerDisplayLinkDelegate controller](self, "controller", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vsync");

}

- (PKHoverController)controller
{
  return (PKHoverController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end

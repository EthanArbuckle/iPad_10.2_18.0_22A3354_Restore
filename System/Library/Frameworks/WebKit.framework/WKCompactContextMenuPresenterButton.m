@implementation WKCompactContextMenuPresenterButton

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  UIContextMenuInteractionDelegate **p_externalDelegate;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  p_externalDelegate = &self->_externalDelegate;
  objc_loadWeak((id *)&self->_externalDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(objc_loadWeak((id *)p_externalDelegate), "contextMenuInteraction:configurationForMenuAtLocation:", a3, x, y);
  v10.receiver = self;
  v10.super_class = (Class)WKCompactContextMenuPresenterButton;
  return -[WKCompactContextMenuPresenterButton contextMenuInteraction:configurationForMenuAtLocation:](&v10, sel_contextMenuInteraction_configurationForMenuAtLocation_, a3, x, y);
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  UIContextMenuInteractionDelegate **p_externalDelegate;
  objc_super v11;

  p_externalDelegate = &self->_externalDelegate;
  objc_loadWeak((id *)&self->_externalDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(objc_loadWeak((id *)p_externalDelegate), "contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:", a3, a4, a5);
  v11.receiver = self;
  v11.super_class = (Class)WKCompactContextMenuPresenterButton;
  return -[WKCompactContextMenuPresenterButton contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:](&v11, sel_contextMenuInteraction_configuration_highlightPreviewForItemWithIdentifier_, a3, a4, a5);
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  UIContextMenuInteractionDelegate **p_externalDelegate;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WKCompactContextMenuPresenterButton;
  -[WKCompactContextMenuPresenterButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v10, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_);
  p_externalDelegate = &self->_externalDelegate;
  objc_loadWeak((id *)p_externalDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)p_externalDelegate), "contextMenuInteraction:willDisplayMenuForConfiguration:animator:", a3, a4, a5);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  UIContextMenuInteractionDelegate **p_externalDelegate;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WKCompactContextMenuPresenterButton;
  -[WKCompactContextMenuPresenterButton contextMenuInteraction:willEndForConfiguration:animator:](&v10, sel_contextMenuInteraction_willEndForConfiguration_animator_);
  p_externalDelegate = &self->_externalDelegate;
  objc_loadWeak((id *)p_externalDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)p_externalDelegate), "contextMenuInteraction:willEndForConfiguration:animator:", a3, a4, a5);
}

- (UIContextMenuInteractionDelegate)externalDelegate
{
  return (UIContextMenuInteractionDelegate *)objc_loadWeak((id *)&self->_externalDelegate);
}

- (void)setExternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_externalDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_externalDelegate);
}

@end

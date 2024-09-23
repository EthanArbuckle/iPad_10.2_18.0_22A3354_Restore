@implementation WKEditorUndoTarget

- (void)undoEditing:(id)a3
{
  WebKit::WebEditCommandProxy::unapply((WebKit::WebEditCommandProxy *)objc_msgSend(a3, "command"));
}

- (void)redoEditing:(id)a3
{
  WebKit::WebEditCommandProxy::reapply((WebKit::WebEditCommandProxy *)objc_msgSend(a3, "command"));
}

@end

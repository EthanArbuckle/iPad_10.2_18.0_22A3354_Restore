@implementation _WKWebExtensionAction

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
    _objc_deallocOnMainThreadHelper();
  else
    dispatch_async_f(MEMORY[0x1E0C80D38], self, (dispatch_function_t)MEMORY[0x1E0DE7980]);
}

- (void)dealloc
{
  objc_super v3;

  (**(void (***)(ObjectStorage<WebKit::WebExtensionAction> *, SEL))self->_webExtensionAction.data.__lx)(&self->_webExtensionAction, a2);
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionAction;
  -[_WKWebExtensionAction dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _WKWebExtensionAction *v4;
  _WKWebExtensionAction *v5;
  _WKWebExtensionAction *v6;
  BOOL v7;

  v4 = (_WKWebExtensionAction *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      if (v6)
      {
        v7 = WebKit::WebExtensionAction::operator==(self->_webExtensionAction.data.__lx, v6->_webExtensionAction.data.__lx);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

      v6 = 0;
    }
    v7 = 0;
    goto LABEL_8;
  }
  v7 = 1;
LABEL_9:

  return v7;
}

- (_WKWebExtensionContext)webExtensionContext
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)&self->_webExtensionAction.data.__lx[24];
  if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0)
  {
    WebKit::WebExtension::wrapper((id *)(v3 - 16));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (_WKWebExtensionContext *)v4;
}

- (_WKWebExtensionTab)associatedTab
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)&self->_webExtensionAction.data.__lx[32];
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
  else
    WeakRetained = 0;
  return (_WKWebExtensionTab *)WeakRetained;
}

- (id)iconForSize:(CGSize)a3
{
  return WebKit::WebExtensionAction::icon((WebKit::WebExtensionAction *)&self->_webExtensionAction, a3);
}

- (NSString)label
{
  id v2;
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  __CFString *v5;
  __CFString *v7;
  __CFString *v8;
  WTF::StringImpl *v9;

  WebKit::WebExtensionAction::label((WebKit::WebExtensionAction *)&self->_webExtensionAction, 1, &v9);
  if (v9)
  {
    v2 = (id)WTF::StringImpl::operator NSString *();
    v3 = v9;
    v5 = (__CFString *)v2;
    v9 = 0;
    if (v3)
    {
      if (*(_DWORD *)v3 == 2)
        WTF::StringImpl::destroy(v3, v4);
      else
        *(_DWORD *)v3 -= 2;
    }
  }
  else
  {
    v5 = &stru_1E351F1B8;
    v7 = &stru_1E351F1B8;
    v8 = &stru_1E351F1B8;
  }
  return (NSString *)v5;
}

- (NSString)badgeText
{
  id v2;
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  __CFString *v5;
  __CFString *v7;
  __CFString *v8;
  WTF::StringImpl *v9;

  WebKit::WebExtensionAction::badgeText((WebKit::WebExtensionAction *)&self->_webExtensionAction, &v9);
  if (v9)
  {
    v2 = (id)WTF::StringImpl::operator NSString *();
    v3 = v9;
    v5 = (__CFString *)v2;
    v9 = 0;
    if (v3)
    {
      if (*(_DWORD *)v3 == 2)
        WTF::StringImpl::destroy(v3, v4);
      else
        *(_DWORD *)v3 -= 2;
    }
  }
  else
  {
    v5 = &stru_1E351F1B8;
    v7 = &stru_1E351F1B8;
    v8 = &stru_1E351F1B8;
  }
  return (NSString *)v5;
}

- (BOOL)hasUnreadBadgeText
{
  return WebKit::WebExtensionAction::hasUnreadBadgeText((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (void)setHasUnreadBadgeText:(BOOL)a3
{
  WebKit::WebExtensionAction::setHasUnreadBadgeText((WebKit::WebExtensionAction *)&self->_webExtensionAction, a3);
}

- (NSString)inspectionName
{
  return (NSString *)WebKit::WebExtensionAction::popupWebViewInspectionName((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (void)setInspectionName:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WebKit::WebExtensionAction::setPopupWebViewInspectionName((WTF::StringImpl **)&self->_webExtensionAction, (const WTF::String *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (BOOL)isEnabled
{
  return WebKit::WebExtensionAction::isEnabled((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (NSArray)menuItems
{
  return (NSArray *)WebKit::WebExtensionAction::platformMenuItems((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (BOOL)presentsPopup
{
  return WebKit::WebExtensionAction::presentsPopup((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (UIViewController)popupViewController
{
  return (UIViewController *)WebKit::WebExtensionAction::popupViewController((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (WKWebView)popupWebView
{
  return (WKWebView *)WebKit::WebExtensionAction::popupWebView((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (void)closePopup
{
  WebKit::WebExtensionAction::closePopup((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionAction;
}

- (void)_webExtensionAction
{
  return &self->_webExtensionAction;
}

@end

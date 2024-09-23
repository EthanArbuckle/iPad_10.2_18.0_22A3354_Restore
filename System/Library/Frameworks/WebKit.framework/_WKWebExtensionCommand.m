@implementation _WKWebExtensionCommand

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

  (**(void (***)(ObjectStorage<WebKit::WebExtensionCommand> *, SEL))self->_webExtensionCommand.data.__lx)(&self->_webExtensionCommand, a2);
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionCommand;
  -[_WKWebExtensionCommand dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_WKWebExtensionCommand identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _WKWebExtensionCommand *v4;
  _WKWebExtensionCommand *v5;
  _WKWebExtensionCommand *v6;
  const WTF::StringImpl *v7;
  char v8;

  v4 = (_WKWebExtensionCommand *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      if (v6)
      {
        v8 = WebKit::WebExtensionCommand::operator==((uint64_t)&self->_webExtensionCommand, (uint64_t)&v6->_webExtensionCommand, v7);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

      v6 = 0;
    }
    v8 = 0;
    goto LABEL_8;
  }
  v8 = 1;
LABEL_9:

  return v8;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  WebKit::WebExtensionCommand *v9;
  WTF::StringImpl *v10;
  const WTF::StringImpl *v11;
  __CFString *v12;
  void *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WKWebExtensionCommand identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WKWebExtensionCommand activationKey](self, "activationKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    v9 = -[_WKWebExtensionCommand _webExtensionCommand](self, "_webExtensionCommand");
    WebKit::WebExtensionCommand::shortcutString(v9, v10, v11, &v17);
    if (v17)
      v12 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
    else
      v12 = &stru_1E351F1B8;
  }
  else
  {
    v12 = CFSTR("(none)");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@; shortcut = %@>"), v5, self, v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    v15 = v17;
    v17 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v14);
      else
        *(_DWORD *)v15 -= 2;
    }
  }

  return (NSString *)v13;
}

- (_WKWebExtensionContext)webExtensionContext
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)&self->_webExtensionCommand.data.__lx[24];
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

- (NSString)identifier
{
  __CFString *v2;

  if (*(_QWORD *)&self->_webExtensionCommand.data.__lx[32])
    v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v2 = &stru_1E351F1B8;
  return (NSString *)v2;
}

- (NSString)discoverabilityTitle
{
  __CFString *v2;

  if (*(_QWORD *)&self->_webExtensionCommand.data.__lx[40])
    v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v2 = &stru_1E351F1B8;
  return (NSString *)v2;
}

- (NSString)activationKey
{
  _WKWebExtensionCommand *v2;
  _DWORD *isa;

  if (*(_DWORD *)self[1]._webExtensionCommand.data.__lx)
    v2 = self + 1;
  else
    v2 = (_WKWebExtensionCommand *)MEMORY[0x1E0CBF6F0];
  isa = v2->super.isa;
  if (v2->super.isa)
  {
    if (isa[1])
      return (NSString *)(id)WTF::StringImpl::operator NSString *();
    isa = 0;
  }
  return (NSString *)isa;
}

- (void)setActivationKey:(id)a3
{
  id v5;
  WTF::StringImpl *v6;
  char v7;
  WTF::StringImpl *v8;
  void *v9;
  WTF::StringImpl *v10;

  v5 = a3;
  MEMORY[0x19AEABCC8](&v10, v5);
  v7 = WebKit::WebExtensionCommand::setActivationKey((uint64_t)&self->_webExtensionCommand, (WTF::String *)&v10);
  v8 = v10;
  v10 = 0;
  if (!v8)
  {
LABEL_4:
    if ((v7 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v8, v6);
  if ((v7 & 1) == 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionCommand.mm"), 104, CFSTR("Invalid parameter: an unsupported character was provided"));

  }
LABEL_7:

}

- (int64_t)modifierFlags
{
  Class isa;

  isa = self[1].super.isa;
  if (isa && *((_DWORD *)isa + 1))
    return *(unsigned int *)self[1]._webExtensionCommand.data.__lx;
  else
    return 0;
}

- (void)setModifierFlags:(int64_t)a3
{
  int v3;
  void *v6;

  v3 = a3;
  if ((a3 & 0xFFFFFFFFFFE1FFFFLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionCommand.mm"), 115, CFSTR("Invalid parameter: an unsupported modifier flag was provided"));

  }
  WebKit::WebExtensionCommand::dispatchChangedEventSoonIfNeeded((CFTypeRef *)&self->_webExtensionCommand, (WTF::StringImpl *)a2, (const WTF::StringImpl *)a3);
  *(_DWORD *)self[1]._webExtensionCommand.data.__lx = v3 & 0x1E0000;
}

- (UIMenuElement)menuItem
{
  return (UIMenuElement *)WebKit::WebExtensionCommand::platformMenuItem((WebKit::WebExtensionCommand *)&self->_webExtensionCommand);
}

- (UIKeyCommand)keyCommand
{
  return (UIKeyCommand *)WebKit::WebExtensionCommand::keyCommand((WebKit::WebExtensionCommand *)&self->_webExtensionCommand);
}

- (NSString)_shortcut
{
  const WTF::StringImpl *v2;
  id v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  __CFString *v6;
  __CFString *v8;
  __CFString *v9;
  WTF::StringImpl *v10;

  WebKit::WebExtensionCommand::shortcutString((WebKit::WebExtensionCommand *)&self->_webExtensionCommand, (WTF::StringImpl *)a2, v2, &v10);
  if (v10)
  {
    v3 = (id)WTF::StringImpl::operator NSString *();
    v4 = v10;
    v6 = (__CFString *)v3;
    v10 = 0;
    if (v4)
    {
      if (*(_DWORD *)v4 == 2)
        WTF::StringImpl::destroy(v4, v5);
      else
        *(_DWORD *)v4 -= 2;
    }
  }
  else
  {
    v6 = &stru_1E351F1B8;
    v8 = &stru_1E351F1B8;
    v9 = &stru_1E351F1B8;
  }
  return (NSString *)v6;
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionCommand;
}

- (void)_webExtensionCommand
{
  return &self->_webExtensionCommand;
}

@end

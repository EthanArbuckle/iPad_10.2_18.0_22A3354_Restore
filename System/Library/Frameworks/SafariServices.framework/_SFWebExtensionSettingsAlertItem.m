@implementation _SFWebExtensionSettingsAlertItem

+ (id)buttonWithTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 extension:(id)a6 handler:(id)a7
{
  id v12;
  _QWORD *v13;
  void *v14;

  v12 = a6;
  objc_msgSend(a1, "singleLineButtonWithTitle:textStyle:icon:action:handler:", a3, a4, a5, 26, a7);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13[25];
  v13[25] = v12;

  return v13;
}

- (WBSWebExtensionData)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
}

@end

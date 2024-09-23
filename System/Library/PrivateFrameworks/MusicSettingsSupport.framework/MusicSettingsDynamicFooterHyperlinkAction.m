@implementation MusicSettingsDynamicFooterHyperlinkAction

- (MusicSettingsDynamicFooterHyperlinkAction)initWithTarget:(id)a3 selectorString:(id)a4
{
  id v6;
  id v7;
  MusicSettingsDynamicFooterHyperlinkAction *v8;
  MusicSettingsDynamicFooterHyperlinkAction *v9;
  uint64_t v10;
  NSString *selectorString;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MusicSettingsDynamicFooterHyperlinkAction;
  v8 = -[MusicSettingsDynamicFooterHyperlinkAction init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_target, v6);
    v10 = objc_msgSend(v7, "copy");
    selectorString = v9->_selectorString;
    v9->_selectorString = (NSString *)v10;

  }
  return v9;
}

- (NSString)selectorString
{
  return self->_selectorString;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_selectorString, 0);
}

@end

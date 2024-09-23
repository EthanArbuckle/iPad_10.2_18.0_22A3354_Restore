@implementation _HUPinCodeActivityItemSource

- (_HUPinCodeActivityItemSource)initWithPinCodeItem:(id)a3
{
  id v5;
  _HUPinCodeActivityItemSource *v6;
  _HUPinCodeActivityItemSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HUPinCodeActivityItemSource;
  v6 = -[_HUPinCodeActivityItemSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pinCodeItem, a3);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1E6F60E80;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  -[_HUPinCodeActivityItemSource pinCodeItem](self, "pinCodeItem", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUPinCodeShareFormatString"), CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB580], 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("number.square.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v7);
  -[_HUPinCodeActivityItemSource pinCodeItem](self, "pinCodeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  objc_msgSend(v12, "setTitle:", v11);
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeValueCellTitle"), CFSTR("HUPinCodeValueCellTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSummary:", v13);

  objc_msgSend(v12, "setIcon:", v8);
  return v12;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[_HUPinCodeActivityItemSource pinCodeItem](self, "pinCodeItem", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    HULocalizedStringWithFormat(CFSTR("HUPinCodeShareAirDropFilename"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  else
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeShareAirDropUnknownGuestFilename"), CFSTR("HUPinCodeShareAirDropUnknownGuestFilename"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("txt"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (HFPinCodeItem)pinCodeItem
{
  return self->_pinCodeItem;
}

- (void)setPinCodeItem:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeItem, 0);
}

@end

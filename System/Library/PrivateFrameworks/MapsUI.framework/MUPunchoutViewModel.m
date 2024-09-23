@implementation MUPunchoutViewModel

+ (id)viewModelForVendorName:(id)a3
{
  id v3;
  MUPunchoutViewModel *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(MUPunchoutViewModel);
  -[MUPunchoutViewModel setSymbolName:](v4, "setSymbolName:", CFSTR("arrow.up.forward.app.fill"));
  v5 = (void *)MEMORY[0x1E0CB3940];
  _MULocalizedStringFromThisBundle(CFSTR("Open %@ [Place Card]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPunchoutViewModel setPunchoutText:](v4, "setPunchoutText:", v7);
  return v4;
}

+ (id)viewModelForAddPhotos
{
  MUPunchoutViewModel *v2;
  void *v3;

  v2 = objc_alloc_init(MUPunchoutViewModel);
  -[MUPunchoutViewModel setSymbolName:](v2, "setSymbolName:", CFSTR("camera.fill"));
  _MULocalizedStringFromThisBundle(CFSTR("Add Photo [Place Card]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutViewModel setPunchoutText:](v2, "setPunchoutText:", v3);

  return v2;
}

+ (id)viewModelForFullScreenGallery
{
  MUPunchoutViewModel *v2;
  void *v3;

  v2 = objc_alloc_init(MUPunchoutViewModel);
  -[MUPunchoutViewModel setSymbolName:](v2, "setSymbolName:", CFSTR("photo.on.rectangle"));
  _MULocalizedStringFromThisBundle(CFSTR("More Photos [Place Card]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutViewModel setPunchoutText:](v2, "setPunchoutText:", v3);

  return v2;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (NSString)punchoutText
{
  return self->_punchoutText;
}

- (void)setPunchoutText:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutText, a3);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  objc_storeStrong((id *)&self->_menu, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_punchoutText, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end

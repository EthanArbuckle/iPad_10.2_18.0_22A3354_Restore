@implementation MKAppleLogoLabel

- (id)initForMapType:(unint64_t)a3 forDarkMode:(BOOL)a4
{
  return -[MKAppleLogoLabel initForMapType:forDarkMode:alternativeStringDrawing:](self, "initForMapType:forDarkMode:alternativeStringDrawing:", a3, a4, 0);
}

- (id)initForMapType:(unint64_t)a3 forDarkMode:(BOOL)a4 alternativeStringDrawing:(BOOL)a5
{
  _BOOL8 v6;
  MKAppleLogoLabel *v8;
  MKAppleLogoLabel *v9;
  void *v10;
  MKAppleLogoLabel *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKAppleLogoLabel;
  v8 = -[MKAppleLogoLabel init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_useAlternativeStringDrawing = a5;
    -[MKAppleLogoLabel setOpaque:](v8, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAppleLogoLabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[MKAppleLogoLabel updateForMapType:darkMode:](v9, "updateForMapType:darkMode:", a3, v6);
    v11 = v9;
  }

  return v9;
}

- (void)updateForMapType:(unint64_t)a3 darkMode:(BOOL)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSAttributedString *v31;
  NSAttributedString *innerText;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[4];
  _QWORD v40[4];
  uint64_t v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 16.0, *MEMORY[0x1E0CEB5E8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 - 1 < 4 || a3 == 107 || a4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.600000024);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0CEA258]);
  objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_systemImageNamed:", CFSTR("applelogo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(v7, "pointSize");
  objc_msgSend(v11, "_mapkit_configurationWithPointSize:weight:scale:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_mapkit_imageWithSymbolConfiguration:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v12;
  objc_msgSend(v12, "imageWithTintColor:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v13);

  v14 = (void *)objc_opt_new();
  v34 = v9;
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendAttributedString:", v15);

  v16 = objc_alloc(MEMORY[0x1E0CB3498]);
  _MKLocalizedStringFromThisBundle(CFSTR("[MapKit] Apple Maps Brand Mark"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithString:", v17);
  objc_msgSend(v14, "appendAttributedString:", v18);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "languageCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("en"));

  if (v21)
  {
    v41 = *MEMORY[0x1E0CEA0B0];
    v42[0] = &unk_1E2158550;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttributes:range:", v22, 1, objc_msgSend(v14, "length") - 1);

  }
  v23 = (void *)objc_msgSend(v14, "mutableCopy");
  v24 = *MEMORY[0x1E0CEA098];
  v40[0] = v7;
  v25 = *MEMORY[0x1E0CEA0A0];
  v39[0] = v24;
  v39[1] = v25;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v26;
  v39[2] = *MEMORY[0x1E0CEA130];
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = *MEMORY[0x1E0CEA138];
  v40[2] = v27;
  v40[3] = &unk_1E2158D40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAttributes:range:", v28, 0, objc_msgSend(v23, "length"));

  if (v33)
    v29 = (void *)objc_msgSend(v23, "copy");
  else
    v29 = 0;
  objc_storeStrong((id *)&self->_strokeText, v29);
  if (v33)

  v37[0] = v24;
  v37[1] = v25;
  v38[0] = v7;
  v38[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAttributes:range:", v30, 0, objc_msgSend(v14, "length"));

  v31 = (NSAttributedString *)objc_msgSend(v14, "copy");
  innerText = self->_innerText;
  self->_innerText = v31;

  -[UIView _mapKit_setNeedsDisplay](self, "_mapKit_setNeedsDisplay");
  -[MKAppleLogoLabel sizeToFit](self, "sizeToFit");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NSAttributedString boundingRectWithSize:options:context:](self->_strokeText, "boundingRectWithSize:options:context:", 0, 0);
  v7 = v6;
  v9 = v8;
  -[NSAttributedString boundingRectWithSize:options:context:](self->_innerText, "boundingRectWithSize:options:context:", 0, 0, width, height);
  if (v7 <= v10)
    v12 = v10;
  else
    v12 = v7;
  if (v9 <= v11)
    v13 = v11;
  else
    v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[MKAppleLogoLabel sizeThatFits:](self, "sizeThatFits:", 1000.0, 1000.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  _BOOL4 useAlternativeStringDrawing;
  NSAttributedString *strokeText;
  NSAttributedString *innerText;
  NSAttributedString *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKAppleLogoLabel;
  -[MKAppleLogoLabel drawRect:](&v8, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  useAlternativeStringDrawing = self->_useAlternativeStringDrawing;
  strokeText = self->_strokeText;
  -[MKAppleLogoLabel bounds](self, "bounds");
  if (useAlternativeStringDrawing)
  {
    -[NSAttributedString drawAtPoint:](strokeText, "drawAtPoint:");
    innerText = self->_innerText;
    -[MKAppleLogoLabel bounds](self, "bounds");
    -[NSAttributedString drawAtPoint:](innerText, "drawAtPoint:");
  }
  else
  {
    -[NSAttributedString drawInRect:](strokeText, "drawInRect:");
    v7 = self->_innerText;
    -[MKAppleLogoLabel bounds](self, "bounds");
    -[NSAttributedString drawInRect:](v7, "drawInRect:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerText, 0);
  objc_storeStrong((id *)&self->_strokeText, 0);
}

@end

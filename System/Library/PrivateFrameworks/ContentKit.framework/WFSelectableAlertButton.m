@implementation WFSelectableAlertButton

+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 selected:(BOOL)a5 style:(int64_t)a6 handler:(id)a7
{
  return (id)objc_msgSend(a1, "buttonWithTitle:subtitle:selected:stickySelection:style:handler:image:", a3, a4, a5, 0, a6, a7, 0);
}

+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 selected:(BOOL)a5 stickySelection:(BOOL)a6 style:(int64_t)a7 handler:(id)a8 image:(id)a9
{
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v16 = a9;
  v17 = a4;
  objc_msgSend(a1, "buttonWithTitle:style:handler:", a3, a7, a8);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "copy");

  v20 = *(void **)(v18 + 64);
  *(_QWORD *)(v18 + 64) = v19;

  v21 = objc_msgSend(v16, "copy");
  v22 = *(void **)(v18 + 72);
  *(_QWORD *)(v18 + 72) = v21;

  *(_BYTE *)(v18 + 56) = a5;
  *(_BYTE *)(v18 + 57) = a6;
  return (id)v18;
}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[WFAlertButton alert](self, "alert");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[WFAlertButton alert](self, "alert");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buttons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", self);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[WFAlertButton alert](self, "alert");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "replaceButtonAtIndex:withButton:forAlert:", v7, self, v8);

    }
  }
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (WFImage)image
{
  return self->_image;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)stickySelection
{
  return self->_stickySelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end

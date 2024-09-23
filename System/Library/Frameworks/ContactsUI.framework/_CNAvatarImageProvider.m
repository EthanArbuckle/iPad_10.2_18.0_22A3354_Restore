@implementation _CNAvatarImageProvider

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  return -[_CNAvatarImageProvider imageForSize:scale:style:](self, "imageForSize:scale:style:", 0, a3.width, a3.height, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likenessProvider, 0);
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4 style:(unint64_t)a5
{
  double height;
  double width;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  height = a3.height;
  width = a3.width;
  if (a5 == 1)
  {
    -[_CNAvatarImageProvider likenessProvider](self, "likenessProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[_CNAvatarImageProvider likenessProvider](self, "likenessProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_cnui_roundedRectImageForSize:scale:", width, height, a4);
      goto LABEL_7;
    }
  }
  else if (!a5)
  {
    -[_CNAvatarImageProvider likenessProvider](self, "likenessProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[_CNAvatarImageProvider likenessProvider](self, "likenessProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_cnui_circularImageForSize:scale:", width, height, a4);
LABEL_7:
      v15 = v12;

      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v15, 0, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      return v16;
    }
  }
  -[_CNAvatarImageProvider likenessProvider](self, "likenessProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  -[_CNAvatarImageProvider likenessProvider](self, "likenessProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((v18 & 1) != 0)
    objc_msgSend(v19, "_cnui_likenessForSize:scale:", width, height, a4);
  else
    objc_msgSend(v19, "_cnui_likeness");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "snapshotWithSize:scale:options:", 0, width, height, a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "roundImage:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CNUIPRLikenessProvider)likenessProvider
{
  return self->_likenessProvider;
}

- (_CNAvatarImageProvider)initWithLikenessProvider:(id)a3
{
  id v5;
  _CNAvatarImageProvider *v6;
  _CNAvatarImageProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CNAvatarImageProvider;
  v6 = -[_CNAvatarImageProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_likenessProvider, a3);

  return v7;
}

+ (id)roundImage:(id)a3
{
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CGSize v15;
  CGRect v16;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = a3;
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "scale");
  v11 = v10;
  v15.width = v7;
  v15.height = v9;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v11);
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v7;
  v16.size.height = v9;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v3, v4, v7, v9, CGRectGetWidth(v16) * 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addClip");

  objc_msgSend(v5, "drawInRect:", v3, v4, v7, v9);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

@end

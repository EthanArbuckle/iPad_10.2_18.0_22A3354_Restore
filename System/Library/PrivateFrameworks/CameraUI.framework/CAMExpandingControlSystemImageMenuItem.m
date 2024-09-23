@implementation CAMExpandingControlSystemImageMenuItem

+ (id)menuItemWithState:(id)a3 systemImageName:(id)a4 symbolConfiguration:(id)a5 subtitle:(id)a6 selectedSubtitle:(id)a7 configuration:(id)a8
{
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;

  v14 = a4;
  v15 = a5;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___CAMExpandingControlSystemImageMenuItem;
  objc_msgSendSuper2(&v21, sel__menuItemWithState_subtitle_selectedSubtitle_configuration_, a3, a6, a7, a8);
  v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16[5];
  v16[5] = v14;
  v18 = v14;

  v19 = (void *)v16[6];
  v16[6] = v15;

  return v16;
}

- (UIImage)titleImage
{
  void *v3;
  void *v4;
  UIImage *v5;
  UIImage *titleImage;

  -[CAMExpandingControlSystemImageMenuItem _titleImage](self, "_titleImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 14.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControlSystemImageMenuItem _imageWithConfiguration:](self, "_imageWithConfiguration:", v4);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    titleImage = self->__titleImage;
    self->__titleImage = v5;

  }
  return -[CAMExpandingControlSystemImageMenuItem _titleImage](self, "_titleImage");
}

- (id)_imageWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CAMExpandingControlSystemImageMenuItem _symbolConfiguration](self, "_symbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMExpandingControlSystemImageMenuItem _symbolConfiguration](self, "_symbolConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationByApplyingConfiguration:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }
  v8 = (void *)MEMORY[0x1E0DC3870];
  -[CAMExpandingControlSystemImageMenuItem _systemImageName](self, "_systemImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemImageNamed:withConfiguration:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqualToItem:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMExpandingControlSystemImageMenuItem;
  if (-[CAMExpandingControlMenuItem isEqualToItem:](&v16, sel_isEqualToItem_, v6))
  {
    -[CAMExpandingControlSystemImageMenuItem _systemImageName](self, "_systemImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_systemImageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      || (-[CAMExpandingControlSystemImageMenuItem _systemImageName](self, "_systemImageName"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "_systemImageName"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToString:", v4)))
    {
      -[CAMExpandingControlSystemImageMenuItem _symbolConfiguration](self, "_symbolConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_symbolConfiguration");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 == (void *)v11)
      {

        v9 = 1;
      }
      else
      {
        v12 = (void *)v11;
        -[CAMExpandingControlSystemImageMenuItem _symbolConfiguration](self, "_symbolConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_symbolConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v13, "isEqualToConfiguration:", v14);

      }
      if (v7 == v8)
        goto LABEL_11;
    }
    else
    {
      v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (NSString)_systemImageName
{
  return self->__systemImageName;
}

- (UIImageSymbolConfiguration)_symbolConfiguration
{
  return self->__symbolConfiguration;
}

- (UIImage)_titleImage
{
  return self->__titleImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleImage, 0);
  objc_storeStrong((id *)&self->__symbolConfiguration, 0);
  objc_storeStrong((id *)&self->__systemImageName, 0);
}

@end

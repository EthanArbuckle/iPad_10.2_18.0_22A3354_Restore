@implementation CAMExpandingControlImageMenuItem

+ (id)menuItemWithState:(id)a3 titleImage:(id)a4 subtitle:(id)a5 selectedSubtitle:(id)a6 configuration:(id)a7
{
  id v12;
  _QWORD *v13;
  void *v14;
  objc_super v16;

  v12 = a4;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___CAMExpandingControlImageMenuItem;
  objc_msgSendSuper2(&v16, sel__menuItemWithState_subtitle_selectedSubtitle_configuration_, a3, a5, a6, a7);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13[5];
  v13[5] = v12;

  return v13;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMExpandingControlImageMenuItem;
  if (-[CAMExpandingControlMenuItem isEqualToItem:](&v9, sel_isEqualToItem_, v4))
  {
    -[CAMExpandingControlImageMenuItem titleImage](self, "titleImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleImage, 0);
}

@end

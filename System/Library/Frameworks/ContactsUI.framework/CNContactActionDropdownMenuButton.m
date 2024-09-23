@implementation CNContactActionDropdownMenuButton

- (CNContactActionDropdownMenuButton)init
{
  CNContactActionDropdownMenuButton *v2;
  void *v3;
  CNContactActionDropdownMenuButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactActionDropdownMenuButton;
  v2 = -[CNContactActionDropdownMenuButton init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionDropdownMenuButton setBackgroundColor:](v2, "setBackgroundColor:", v3);

    v4 = v2;
  }

  return v2;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  CGFloat MidX;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;
  CGRect v15;

  v4 = a3;
  -[CNContactActionDropdownMenuButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  if (v6 == 2)
  {
    -[CNContactActionDropdownMenuButton frame](self, "frame");
    MidX = CGRectGetMidX(v15);
    v8 = 0.0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CNContactActionDropdownMenuButton;
    -[CNContactActionDropdownMenuButton menuAttachmentPointForConfiguration:](&v13, sel_menuAttachmentPointForConfiguration_, v4);
    MidX = v9;
    v8 = v10;
  }

  v11 = MidX;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

@end

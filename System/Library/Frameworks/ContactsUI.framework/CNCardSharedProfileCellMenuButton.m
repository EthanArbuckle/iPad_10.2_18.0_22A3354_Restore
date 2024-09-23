@implementation CNCardSharedProfileCellMenuButton

- (CNCardSharedProfileCellMenuButton)init
{
  CNCardSharedProfileCellMenuButton *v2;
  void *v3;
  CNCardSharedProfileCellMenuButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNCardSharedProfileCellMenuButton;
  v2 = -[CNCardSharedProfileCellMenuButton init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellMenuButton setBackgroundColor:](v2, "setBackgroundColor:", v3);

    v4 = v2;
  }

  return v2;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGPoint result;

  v9.receiver = self;
  v9.super_class = (Class)CNCardSharedProfileCellMenuButton;
  -[CNCardSharedProfileCellMenuButton menuAttachmentPointForConfiguration:](&v9, sel_menuAttachmentPointForConfiguration_, a3);
  v5 = v4;
  -[CNCardSharedProfileCellMenuButton frame](self, "frame");
  v7 = v6;
  v8 = v5;
  result.y = v8;
  result.x = v7;
  return result;
}

@end

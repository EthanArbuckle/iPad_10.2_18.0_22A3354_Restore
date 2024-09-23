@implementation ICTableAttachmentView

- (void)sharedInit:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTableAttachmentView;
  -[ICAttachmentView sharedInit:](&v5, sel_sharedInit_, a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentView setOutsideViews:](self, "setOutsideViews:", v4);

}

- (void)updateHighlights
{
  -[ICTableAttachmentView foregroundAlpha](self, "foregroundAlpha");
  -[ICTableAttachmentView ic_setAlpha:](self, "ic_setAlpha:");
}

- (NSMutableArray)outsideViews
{
  return self->_outsideViews;
}

- (void)setOutsideViews:(id)a3
{
  objc_storeStrong((id *)&self->_outsideViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outsideViews, 0);
}

@end

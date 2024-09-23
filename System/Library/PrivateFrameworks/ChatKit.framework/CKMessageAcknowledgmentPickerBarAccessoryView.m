@implementation CKMessageAcknowledgmentPickerBarAccessoryView

- (CKMessageAcknowledgmentPickerBarAccessoryView)initWithChatItem:(id)a3 layoutBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CKMessageAcknowledgmentPickerBarAccessoryView *v18;
  CKMessageAcknowledgmentPickerBarAccessoryView *v19;
  void *v20;
  int64x2_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  objc_super v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (objc_msgSend(v9, "isFromMe"))
    v10 = 8;
  else
    v10 = 2;
  v27 = *MEMORY[0x1E0C9D538];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v11, "acknowledgementPickerBarClass")), "initWithChatItem:", v9);

  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v15 = v14;
  v17 = v16;

  v29.receiver = self;
  v29.super_class = (Class)CKMessageAcknowledgmentPickerBarAccessoryView;
  v22 = vdupq_n_s64(1uLL);
  v23 = v10;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v28 = 2;
  v18 = -[_UIContextMenuAccessoryView initWithFrame:configuration:](&v29, sel_initWithFrame_configuration_, &v22, 0.0, 0.0, v15, v17);
  v19 = v18;
  if (v18)
  {
    -[CKMessageAcknowledgmentPickerBarAccessoryView setChatItem:](v18, "setChatItem:", v9);
    -[CKMessageAcknowledgmentPickerBarAccessoryView setLayoutBounds:](v19, "setLayoutBounds:", x, y, width, height);
    objc_msgSend(v12, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageAcknowledgmentPickerBarAccessoryView addSubview:](v19, "addSubview:", v20);

    -[CKMessageAcknowledgmentPickerBarAccessoryView setPickerViewController:](v19, "setPickerViewController:", v12);
  }

  return v19;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  if (-[CKMessageAcknowledgmentPickerBarAccessoryView visible](self, "visible", a3, a4) != a3)
  {
    -[CKMessageAcknowledgmentPickerBarAccessoryView setVisible:](self, "setVisible:", v4);
    -[CKMessageAcknowledgmentPickerBarAccessoryView pickerViewController](self, "pickerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
      objc_msgSend(v6, "performShowAnimation:", 0);
    else
      objc_msgSend(v6, "performSendAnimation:", 0);

  }
}

- (CGPoint)attachmentOffsetWithReferenceFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxX;
  double v32;
  double MinY;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat rect;
  CGPoint result;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKMessageAcknowledgmentPickerBarAccessoryView pickerViewController](self, "pickerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageAcknowledgmentPickerBarAccessoryView layoutBounds](self, "layoutBounds");
  objc_msgSend(v8, "calculateFrameRelativeToSiblingViewFrame:withinBounds:", x, y, width, height, v9, v10, v11, v12);
  v40 = v14;
  v41 = v13;
  v38 = v16;
  v39 = v15;

  -[CKMessageAcknowledgmentPickerBarAccessoryView pickerViewController](self, "pickerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  rect = v25;

  -[CKMessageAcknowledgmentPickerBarAccessoryView chatItem](self, "chatItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v26, "isFromMe");

  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  if ((_DWORD)v18)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v27);
    v44.origin.x = v20;
    v44.origin.y = v22;
    v44.size.width = v24;
    v44.size.height = rect;
    v32 = MaxX - CGRectGetWidth(v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MinY = CGRectGetMinY(v45);
  }
  else
  {
    MinY = CGRectGetMinY(*(CGRect *)&v27);
    v32 = x;
  }
  v46.origin.x = v32;
  v46.origin.y = v22;
  v46.size.width = v24;
  v46.size.height = rect;
  v34 = MinY - CGRectGetHeight(v46);
  -[CKMessageAcknowledgmentPickerBarAccessoryView pickerViewController](self, "pickerViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "adjustTailRelativeSiblingViewFrame:pickerFrame:", x, y, width, height, v41, v40, v39, v38);

  v36 = v41 - v32;
  v37 = v40 - v34;
  result.y = v37;
  result.x = v36;
  return result;
}

- (CKMessageAcknowledgmentPickerBarViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (void)setPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pickerViewController, a3);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (CGRect)layoutBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_layoutBounds.origin.x;
  y = self->_layoutBounds.origin.y;
  width = self->_layoutBounds.size.width;
  height = self->_layoutBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLayoutBounds:(CGRect)a3
{
  self->_layoutBounds = a3;
}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_chatItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end

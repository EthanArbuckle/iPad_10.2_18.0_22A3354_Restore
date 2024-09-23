@implementation CKSimpleAcknowledgementGlyphView

- (CKSimpleAcknowledgementGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  uint64_t v4;
  CKSimpleAcknowledgementGlyphView *v5;
  CKSimpleAcknowledgementGlyphView *v6;
  void *v7;
  CKAcknowledgmentGlyphImageView *v8;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CKSimpleAcknowledgementGlyphView;
  v5 = -[CKSimpleAcknowledgementGlyphView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[CKSimpleAcknowledgementGlyphView setBackgroundColor:](v5, "setBackgroundColor:", 0);
    -[CKSimpleAcknowledgementGlyphView glyphImageForType:color:](v6, "glyphImageForType:color:", -[CKAcknowledgmentGlyphView acknowledgmentType](v6, "acknowledgmentType"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKAcknowledgmentGlyphImageView initWithImage:]([CKAcknowledgmentGlyphImageView alloc], "initWithImage:", v7);
    -[CKAcknowledgmentGlyphImageView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[CKSimpleAcknowledgementGlyphView setGlyph:](v6, "setGlyph:", v8);
    -[CKSimpleAcknowledgementGlyphView addSubview:](v6, "addSubview:", v8);

  }
  return v6;
}

- (id)glyphImageForType:(int64_t)a3 color:(char)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  switch(a3)
  {
    case 2000:
      switch(a4)
      {
        case 4:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "whiteHeartAckImage");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        case 3:
          goto LABEL_18;
        case -1:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "grayHeartAckImage");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
      }
      goto LABEL_17;
    case 2001:
      switch(a4)
      {
        case 4:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "whiteThumbsUpAckImage");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        case 3:
          goto LABEL_18;
        case -1:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "grayThumbsUpAckImage");
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
      }
      goto LABEL_17;
    case 2002:
      switch(a4)
      {
        case 4:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "whiteThumbsDownAckImage");
          v5 = objc_claimAutoreleasedReturnValue();
          break;
        case 3:
LABEL_18:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "redHeartAckImage");
          v5 = objc_claimAutoreleasedReturnValue();
          break;
        case -1:
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "grayThumbsDownAckImage");
          v5 = objc_claimAutoreleasedReturnValue();
          break;
        default:
          goto LABEL_17;
      }
      goto LABEL_23;
    case 2003:
      if (a4 == 4)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "whiteHaAckImage");
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a4 != -1)
        {
LABEL_17:
          v6 = 0;
          return v6;
        }
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "grayHaAckImage");
        v5 = objc_claimAutoreleasedReturnValue();
      }
LABEL_23:
      v6 = (void *)v5;

      return v6;
    default:
      goto LABEL_17;
  }
}

- (CGPoint)glyphOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)animationDuration
{
  return 1.0;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSimpleAcknowledgementGlyphView;
  -[CKSimpleAcknowledgementGlyphView layoutSubviews](&v4, sel_layoutSubviews);
  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSimpleAcknowledgementGlyphView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)setGlyphColor:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKSimpleAcknowledgementGlyphView;
  v4 = a3;
  -[CKAcknowledgmentGlyphView setGlyphColor:](&v11, sel_setGlyphColor_, v4);
  -[CKSimpleAcknowledgementGlyphView glyph](self, "glyph", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKAcknowledgmentGlyphView acknowledgmentType](self, "acknowledgmentType");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ckAcknowledgementColorTypeForColor:", v4);

  -[CKSimpleAcknowledgementGlyphView glyphImageForType:color:](self, "glyphImageForType:color:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v10);

}

- (CKAcknowledgmentGlyphImageView)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_glyph, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
}

@end

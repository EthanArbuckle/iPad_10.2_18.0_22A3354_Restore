@implementation DOCLabel

- (BOOL)_useShortcutIntrinsicContentSize
{
  return !self->_intrinsicContentSizeShortcutDisabled;
}

- (void)setText:(id)a3
{
  NSNumber *useAttributedTextNumber;
  id v6;
  NSNumber *v7;
  void *v8;
  objc_super v9;

  useAttributedTextNumber = self->useAttributedTextNumber;
  v6 = a3;
  if (-[NSNumber BOOLValue](useAttributedTextNumber, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCLabel.m"), 45, CFSTR("Mixing text and attributedText is not suggested, see comments in DOCLabel"));

  }
  v7 = self->useAttributedTextNumber;
  self->useAttributedTextNumber = (NSNumber *)MEMORY[0x24BDBD1C0];

  v9.receiver = self;
  v9.super_class = (Class)DOCLabel;
  -[DOCLabel setText:](&v9, sel_setText_, v6);

}

- (DOCLabel)initWithFrame:(CGRect)a3
{
  DOCLabel *v3;
  DOCLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCLabel;
  v3 = -[DOCLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DOCLabel doc_commonInit](v3, "doc_commonInit");
  return v4;
}

- (void)doc_commonInit
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6F30], "doc_traitsAffectingFonts");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)-[DOCLabel registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel_updateForChangedTraitsAffectingFonts);

}

- (void)setAttributedText:(id)a3
{
  id v5;
  NSNumber *useAttributedTextNumber;
  NSNumber *v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  useAttributedTextNumber = self->useAttributedTextNumber;
  if (useAttributedTextNumber && !-[NSNumber BOOLValue](useAttributedTextNumber, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCLabel.m"), 52, CFSTR("Mixing text and attributedText is not suggested, see comments in DOCLabel"));

  }
  v7 = self->useAttributedTextNumber;
  self->useAttributedTextNumber = (NSNumber *)MEMORY[0x24BDBD1C8];

  v9.receiver = self;
  v9.super_class = (Class)DOCLabel;
  -[DOCLabel setAttributedText:](&v9, sel_setAttributedText_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->useAttributedTextNumber, 0);
}

- (DOCLabel)initWithCoder:(id)a3
{
  DOCLabel *v3;
  DOCLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCLabel;
  v3 = -[DOCLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[DOCLabel doc_commonInit](v3, "doc_commonInit");
  return v4;
}

- (CGSize)doc_effectiveContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  self->_intrinsicContentSizeShortcutDisabled = 1;
  -[DOCLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[DOCLabel intrinsicContentSize](self, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  self->_intrinsicContentSizeShortcutDisabled = 0;
  -[DOCLabel frame](self, "frame");
  if (v4 >= v7)
    v8 = v7;
  else
    v8 = v4;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateForChangedTraitsAffectingFonts
{
  if (-[DOCLabel adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    -[DOCLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

@end

@implementation NTKCFaceDetailComplicationCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (double)rowHeight
{
  return *MEMORY[0x1E0DC53D8];
}

- (NTKCFaceDetailComplicationCell)initWithSlot:(id)a3 dateSlot:(BOOL)a4 isRichSlot:(BOOL)a5 inFace:(id)a6
{
  id v10;
  id v11;
  NTKCFaceDetailComplicationCell *v12;
  uint64_t v13;
  NSString *slot;
  void *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NTKCFaceDetailComplicationCell;
  v12 = -[NTKCDetailTableViewCell initWithStyle:](&v18, sel_initWithStyle_, 1);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    slot = v12->_slot;
    v12->_slot = (NSString *)v13;

    v12->_dateSlot = a4;
    v12->_isRichSlot = a5;
    -[NTKCFaceDetailComplicationCell setEnabled:](v12, "setEnabled:", 1);
    objc_msgSend(v11, "displayNameForComplicationSlot:", v12->_slot);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationCell textLabel](v12, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

    -[NTKCDetailTableViewCell setShowsSeparator:](v12, "setShowsSeparator:", 1);
    -[NTKCDetailTableViewCell setIgnoresRTLCorrection:](v12, "setIgnoresRTLCorrection:", 1);
    -[NTKCFaceDetailComplicationCell setAccessoryType:](v12, "setAccessoryType:", 1);
    -[NTKCFaceDetailComplicationCell _updateLabelFonts](v12, "_updateLabelFonts");
  }

  return v12;
}

- (void)_updateLabelFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[NTKCFaceDetailComplicationCell _traitCollectionAdjustedIfNeeded](self, "_traitCollectionAdjustedIfNeeded");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AD0], v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailComplicationCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v3);

  -[NTKCFaceDetailComplicationCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[NTKCFaceDetailComplicationCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v4);

  -[NTKCFaceDetailComplicationCell detailTextLabel](self, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

}

- (id)_traitCollectionAdjustedIfNeeded
{
  void *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;

  -[NTKCFaceDetailComplicationCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0DC48D0];
  if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending)
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v5);
  else
    -[NTKCFaceDetailComplicationCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setComplication:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_complication) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_complication, a3);
    -[NTKCFaceDetailComplicationCell _updateDetailText](self, "_updateDetailText");
  }

}

- (void)_updateDetailText
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_dateSlot && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[NTKDateComplicationController textForDateStyle:](NTKDateComplicationController, "textForDateStyle:", -[NTKComplication dateStyle](self->_complication, "dateStyle"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKComplication ntk_localizedNameWithOptions:forRichComplicationSlot:](self->_complication, "ntk_localizedNameWithOptions:forRichComplicationSlot:", 1, -[NTKCFaceDetailComplicationCell isRichSlot](self, "isRichSlot"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v3;
  -[NTKCFaceDetailComplicationCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[NTKCFaceDetailComplicationCell _updateState](self, "_updateState");
  }
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v4;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    self->_active = 0;
    if (self->_enabled)
      v4 = 3;
    else
      v4 = 0;
    -[NTKCFaceDetailComplicationCell setSelectionStyle:](self, "setSelectionStyle:", v4);
    -[NTKCFaceDetailComplicationCell _updateState](self, "_updateState");
  }
}

- (void)_updateState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_enabled)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTextColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationCell textLabel](self, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v3);

    if (self->_active)
      -[NTKCFaceDetailComplicationCell _activeColor](self, "_activeColor");
    else
      -[NTKCFaceDetailComplicationCell _inactiveColor](self, "_inactiveColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKCFaceDetailComplicationCell _disabledColor](self, "_disabledColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationCell textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

    -[NTKCFaceDetailComplicationCell _disabledColor](self, "_disabledColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v5;
  -[NTKCFaceDetailComplicationCell detailTextLabel](self, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

}

- (id)_disabledColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
}

- (id)_inactiveColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (NSString)slot
{
  return self->_slot;
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (BOOL)dateSlot
{
  return self->_dateSlot;
}

- (BOOL)isRichSlot
{
  return self->_isRichSlot;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_slot, 0);
}

@end

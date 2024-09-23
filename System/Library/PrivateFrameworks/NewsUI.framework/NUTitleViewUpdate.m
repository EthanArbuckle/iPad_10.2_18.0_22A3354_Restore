@implementation NUTitleViewUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityTitle, 0);
  objc_storeStrong(&self->_value, 0);
}

- (void)setAccessibilityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setCancelPendingUpdates:(BOOL)a3
{
  self->_cancelPendingUpdates = a3;
}

- (void)setSpeakAccessibilityTitleWhenDisplayed:(BOOL)a3
{
  self->_speakAccessibilityTitleWhenDisplayed = a3;
}

- (NUTitleViewUpdate)initWithValue:(id)a3 valueType:(unint64_t)a4 styleType:(unint64_t)a5
{
  id v9;
  NUTitleViewUpdate *v10;
  NUTitleViewUpdate *v11;
  unint64_t v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NUTitleViewUpdate;
  v10 = -[NUTitleViewUpdate init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_value, a3);
    v12 = 3;
    if (v9)
      v12 = a4;
    v11->_valueType = v12;
    v11->_styleType = a5;
    v11->_cancelPendingUpdates = 0;
    v11->_speakAccessibilityTitleWhenDisplayed = v12 == 1;
    v11->_lingerTimeInterval = 0.0;
    v11->_textAlignment = 1;
  }

  return v11;
}

- (NUTitleViewUpdate)initWithAttributedText:(id)a3 styleType:(unint64_t)a4
{
  return -[NUTitleViewUpdate initWithValue:valueType:styleType:](self, "initWithValue:valueType:styleType:", a3, 4, a4);
}

- (BOOL)isEqual:(id)a3
{
  NUTitleViewUpdate *v4;
  NUTitleViewUpdate *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (NUTitleViewUpdate *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NUTitleViewUpdate valueType](self, "valueType");
      if (v6 == -[NUTitleViewUpdate valueType](v5, "valueType"))
      {
        v7 = (void *)MEMORY[0x24BEDCDF0];
        -[NUTitleViewUpdate value](self, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUTitleViewUpdate value](v5, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (id)value
{
  return self->_value;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)shouldCancelPendingUpdates
{
  return self->_cancelPendingUpdates;
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (BOOL)shouldSpeakAccessibilityTitleWhenDisplayed
{
  return self->_speakAccessibilityTitleWhenDisplayed;
}

- (double)lingerTimeInterval
{
  return self->_lingerTimeInterval;
}

- (NUTitleViewUpdate)init
{
  return -[NUTitleViewUpdate initWithValue:valueType:styleType:](self, "initWithValue:valueType:styleType:", 0, 3, 2);
}

- (NUTitleViewUpdate)initWithImage:(id)a3
{
  return -[NUTitleViewUpdate initWithValue:valueType:styleType:](self, "initWithValue:valueType:styleType:", a3, 0, 2);
}

- (NUTitleViewUpdate)initWithText:(id)a3 styleType:(unint64_t)a4
{
  return -[NUTitleViewUpdate initWithValue:valueType:styleType:](self, "initWithValue:valueType:styleType:", a3, 1, a4);
}

- (NUTitleViewUpdate)initWithText:(id)a3 styleType:(unint64_t)a4 glyph:(id)a5
{
  id v8;
  id v9;
  NUTextAndGlyph *v10;
  NUTitleViewUpdate *v11;

  v8 = a5;
  v9 = a3;
  v10 = -[NUTextAndGlyph initWithText:glyph:]([NUTextAndGlyph alloc], "initWithText:glyph:", v9, v8);

  v11 = -[NUTitleViewUpdate initWithValue:valueType:styleType:](self, "initWithValue:valueType:styleType:", v10, 2, a4);
  return v11;
}

- (unint64_t)styleType
{
  return self->_styleType;
}

- (void)setLingerTimeInterval:(double)a3
{
  self->_lingerTimeInterval = a3;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

@end

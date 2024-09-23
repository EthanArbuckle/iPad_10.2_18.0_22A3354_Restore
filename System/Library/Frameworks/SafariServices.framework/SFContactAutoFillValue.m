@implementation SFContactAutoFillValue

- (SFContactAutoFillValue)initWithMatches:(id)a3 displayValue:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  id v10;
  SFContactAutoFillValue *v11;
  SFContactAutoFillValue *v12;
  uint64_t v13;
  NSArray *matches;
  uint64_t v15;
  NSString *displayValue;
  uint64_t v17;
  NSString *label;
  SFContactAutoFillValue *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SFContactAutoFillValue;
  v11 = -[SFContactAutoFillValue init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_selected = 1;
    v13 = objc_msgSend(v8, "copy");
    matches = v12->_matches;
    v12->_matches = (NSArray *)v13;

    v15 = objc_msgSend(v9, "copy");
    displayValue = v12->_displayValue;
    v12->_displayValue = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    label = v12->_label;
    v12->_label = (NSString *)v17;

    v19 = v12;
  }

  return v12;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (NSArray)matches
{
  return self->_matches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matches, 0);
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

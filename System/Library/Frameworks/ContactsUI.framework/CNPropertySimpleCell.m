@implementation CNPropertySimpleCell

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (id)valueView
{
  UILabel *valueLabel;
  UILabel *v4;
  UILabel *v5;

  valueLabel = self->_valueLabel;
  if (!valueLabel)
  {
    -[CNLabeledCell standardValueView](self, "standardValueView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_valueLabel;
    self->_valueLabel = v4;

    valueLabel = self->_valueLabel;
  }
  return valueLabel;
}

- (id)labelView
{
  UILabel *labelLabel;
  UILabel *v4;
  UILabel *v5;

  labelLabel = self->_labelLabel;
  if (!labelLabel)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_labelLabel;
    self->_labelLabel = v4;

    labelLabel = self->_labelLabel;
  }
  return labelLabel;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
}

@end

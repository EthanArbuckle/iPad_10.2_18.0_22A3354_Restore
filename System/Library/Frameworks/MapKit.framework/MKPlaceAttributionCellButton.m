@implementation MKPlaceAttributionCellButton

- (void)setHighlighted:(BOOL)a3
{
  id v4;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[MKPlaceAttributionCellButton buttonDelegate](self, "buttonDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionCellButton:isHighighted:executeAction:", self, self->_highlighted, 0);

  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (MKPlaceAttributionCellButtonDelegate)buttonDelegate
{
  return (MKPlaceAttributionCellButtonDelegate *)objc_loadWeakRetained((id *)&self->_buttonDelegate);
}

- (void)setButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonDelegate);
}

@end

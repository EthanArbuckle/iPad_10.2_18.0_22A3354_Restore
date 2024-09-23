@implementation AXRVoiceOverTouchPadView

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)AXRLocalizedStringForKey();
}

- (id)accessibilityHint
{
  return (id)AXRLocalizedStringForKey();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDFEEB8] | *MEMORY[0x24BDF7418];
}

- (void)_accessibilitySetCurrentGesture:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v6, "count") >= 3)
  {
    objc_msgSend(v6, "objectAtIndex:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length"))
    {
      -[AXRVoiceOverTouchPadView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "voiceOverTouchPadView:didReceiveCommand:", self, v4);

    }
  }

}

- (AXRVoiceOverTouchPadViewDelegate)delegate
{
  return (AXRVoiceOverTouchPadViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

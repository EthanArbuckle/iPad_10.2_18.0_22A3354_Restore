@implementation PHAbstractCallParticipantLabelView

- (PHAbstractCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3 delegate:(id)a4
{
  id v5;
  PHAbstractCallParticipantLabelView *v6;
  PHAbstractCallParticipantLabelView *v7;
  void *v8;
  UILabel *v9;
  UILabel *participantMarqueeLabel;
  void *v11;
  objc_super v13;

  v5 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHAbstractCallParticipantLabelView;
  v6 = -[PHAbstractCallParticipantLabelView initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView layer](v6, "layer"));
    objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

    v7->_activityState = -1;
    objc_storeWeak((id *)&v7->_delegate, v5);
    v9 = (UILabel *)objc_alloc_init((Class)UILabel);
    participantMarqueeLabel = v7->_participantMarqueeLabel;
    v7->_participantMarqueeLabel = v9;

    -[UILabel setAccessibilityIdentifier:](v7->_participantMarqueeLabel, "setAccessibilityIdentifier:", CFSTR("PHMarqueeView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
    -[UILabel setTextColor:](v7->_participantMarqueeLabel, "setTextColor:", v11);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_participantMarqueeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setMarqueeEnabled:](v7->_participantMarqueeLabel, "setMarqueeEnabled:", 1);
    -[UILabel setMarqueeRunning:](v7->_participantMarqueeLabel, "setMarqueeRunning:", 1);
    -[PHAbstractCallParticipantLabelView addSubview:](v7, "addSubview:", v7->_participantMarqueeLabel);
  }

  return v7;
}

- (PHAbstractCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3
{
  return -[PHAbstractCallParticipantLabelView initWithCallDisplayStyleManager:delegate:](self, "initWithCallDisplayStyleManager:delegate:", a3, 0);
}

- (void)setParticipantName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *participantName;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_participantName, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    participantName = self->_participantName;
    self->_participantName = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    objc_msgSend(v7, "setText:", v4);

    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updated participant label with name %@", (uint8_t *)&v10, 0xCu);
    }

    -[PHAbstractCallParticipantLabelView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PHAbstractCallParticipantLabelView;
  -[PHAbstractCallParticipantLabelView setUserInteractionEnabled:](&v6, "setUserInteractionEnabled:");
  v5 = 0.5;
  if (v3)
    v5 = 1.0;
  -[PHAbstractCallParticipantLabelView setAlpha:](self, "setAlpha:", v5);
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[UILabel setTextColor:](self->_participantMarqueeLabel, "setTextColor:", v5);
  }

}

- (double)labelAlphaValueForActivityState:(unsigned __int16)a3
{
  return 1.0;
}

- (UILabel)participantMarqueeLabel
{
  return (UILabel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setParticipantMarqueeLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UILabel)statusLabel
{
  return (UILabel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStatusLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CNKCallParticipantLabelDescriptorProtocol)labelDescriptor
{
  return self->_labelDescriptor;
}

- (BOOL)hidesLabel
{
  return self->_hidesLabel;
}

- (void)setHidesLabel:(BOOL)a3
{
  self->_hidesLabel = a3;
}

- (BOOL)showsConferenceParticipantsButton
{
  return self->_showsConferenceParticipantsButton;
}

- (BOOL)showsCallDetailsViewButton
{
  return self->_showsCallDetailsViewButton;
}

- (NSString)participantName
{
  return self->_participantName;
}

- (unsigned)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(unsigned __int16)a3
{
  self->_activityState = a3;
}

- (PHCallParticipantLabelDelegate)delegate
{
  return (PHCallParticipantLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_labelDescriptor, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_participantMarqueeLabel, 0);
}

@end

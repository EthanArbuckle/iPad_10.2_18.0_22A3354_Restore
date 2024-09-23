@implementation AVMediaTimelineControlLabelsConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  AVMediaTimelineControlLabelsConfiguration *v4;

  v4 = objc_alloc_init(AVMediaTimelineControlLabelsConfiguration);
  -[AVMediaTimelineControlLabelsConfiguration setExtendedDynamicRangeGain:](v4, "setExtendedDynamicRangeGain:", self->_extendedDynamicRangeGain);
  -[AVMediaTimelineControlLabelsConfiguration setTextFont:](v4, "setTextFont:", self->_textFont);
  -[AVMediaTimelineControlLabelsConfiguration setTextColor:](v4, "setTextColor:", self->_textColor);
  -[AVMediaTimelineControlLabelsConfiguration setLabelsStyle:](v4, "setLabelsStyle:", -[AVMediaTimelineControlLabelsConfiguration labelsStyle](self, "labelsStyle"));
  return v4;
}

- (double)extendedDynamicRangeGain
{
  return self->_extendedDynamicRangeGain;
}

- (void)setExtendedDynamicRangeGain:(double)a3
{
  self->_extendedDynamicRangeGain = a3;
}

- (unint64_t)labelsStyle
{
  return self->_labelsStyle;
}

- (void)setLabelsStyle:(unint64_t)a3
{
  self->_labelsStyle = a3;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (void)setTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_textFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

+ (id)_defaultFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeFontWithFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_defaultTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (id)hiddenConfiguration
{
  AVMediaTimelineControlLabelsConfiguration *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(AVMediaTimelineControlLabelsConfiguration);
  -[AVMediaTimelineControlLabelsConfiguration setLabelsStyle:](v2, "setLabelsStyle:", 2);
  +[AVMediaTimelineControlLabelsConfiguration _defaultFont](AVMediaTimelineControlLabelsConfiguration, "_defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlLabelsConfiguration setTextFont:](v2, "setTextFont:", v3);

  +[AVMediaTimelineControlLabelsConfiguration _defaultTextColor](AVMediaTimelineControlLabelsConfiguration, "_defaultTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlLabelsConfiguration setTextColor:](v2, "setTextColor:", v4);

  return v2;
}

+ (id)belowConfiguration
{
  AVMediaTimelineControlLabelsConfiguration *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(AVMediaTimelineControlLabelsConfiguration);
  -[AVMediaTimelineControlLabelsConfiguration setLabelsStyle:](v2, "setLabelsStyle:", 1);
  +[AVMediaTimelineControlLabelsConfiguration _defaultFont](AVMediaTimelineControlLabelsConfiguration, "_defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlLabelsConfiguration setTextFont:](v2, "setTextFont:", v3);

  +[AVMediaTimelineControlLabelsConfiguration _defaultTextColor](AVMediaTimelineControlLabelsConfiguration, "_defaultTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlLabelsConfiguration setTextColor:](v2, "setTextColor:", v4);

  return v2;
}

+ (id)inlineConfiguration
{
  AVMediaTimelineControlLabelsConfiguration *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(AVMediaTimelineControlLabelsConfiguration);
  -[AVMediaTimelineControlLabelsConfiguration setLabelsStyle:](v2, "setLabelsStyle:", 0);
  +[AVMediaTimelineControlLabelsConfiguration _defaultFont](AVMediaTimelineControlLabelsConfiguration, "_defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlLabelsConfiguration setTextFont:](v2, "setTextFont:", v3);

  +[AVMediaTimelineControlLabelsConfiguration _defaultTextColor](AVMediaTimelineControlLabelsConfiguration, "_defaultTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlLabelsConfiguration setTextColor:](v2, "setTextColor:", v4);

  return v2;
}

@end

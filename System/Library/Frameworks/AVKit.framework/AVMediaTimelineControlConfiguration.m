@implementation AVMediaTimelineControlConfiguration

- (void)setLabelsConfiguration:(id)a3
{
  AVMediaTimelineControlLabelsConfiguration *v4;
  AVMediaTimelineControlLabelsConfiguration *labelsConfiguration;

  if (self->_labelsConfiguration != a3)
  {
    v4 = (AVMediaTimelineControlLabelsConfiguration *)objc_msgSend(a3, "copy");
    labelsConfiguration = self->_labelsConfiguration;
    self->_labelsConfiguration = v4;

  }
}

- (AVMediaTimelineControlLabelsConfiguration)labelsConfiguration
{
  return (AVMediaTimelineControlLabelsConfiguration *)(id)-[AVMediaTimelineControlLabelsConfiguration copy](self->_labelsConfiguration, "copy");
}

- (void)setCurrentValueVisualEffect:(id)a3
{
  UIVisualEffect *v5;
  UIVisualEffect **p_currentValueVisualEffect;
  UIVisualEffect *currentValueVisualEffect;
  UIVisualEffect *v8;

  v5 = (UIVisualEffect *)a3;
  currentValueVisualEffect = self->_currentValueVisualEffect;
  p_currentValueVisualEffect = &self->_currentValueVisualEffect;
  if (currentValueVisualEffect != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_currentValueVisualEffect, a3);
    v5 = v8;
  }

}

- (UIVisualEffect)currentValueVisualEffect
{
  return (UIVisualEffect *)(id)-[UIVisualEffect copy](self->_currentValueVisualEffect, "copy");
}

- (void)setMaxValueVisualEffect:(id)a3
{
  UIVisualEffect *v5;
  UIVisualEffect **p_maxValueVisualEffect;
  UIVisualEffect *maxValueVisualEffect;
  UIVisualEffect *v8;

  v5 = (UIVisualEffect *)a3;
  maxValueVisualEffect = self->_maxValueVisualEffect;
  p_maxValueVisualEffect = &self->_maxValueVisualEffect;
  if (maxValueVisualEffect != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_maxValueVisualEffect, a3);
    v5 = v8;
  }

}

- (UIVisualEffect)maxValueVisualEffect
{
  return (UIVisualEffect *)(id)-[UIVisualEffect copy](self->_maxValueVisualEffect, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVMediaTimelineControlConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(AVMediaTimelineControlConfiguration);
  -[AVMediaTimelineControlConfiguration extendedDynamicRangeGain](self, "extendedDynamicRangeGain");
  -[AVMediaTimelineControlConfiguration setExtendedDynamicRangeGain:](v4, "setExtendedDynamicRangeGain:");
  -[AVMediaTimelineControlConfiguration labelsConfiguration](self, "labelsConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlConfiguration setLabelsConfiguration:](v4, "setLabelsConfiguration:", v5);

  -[AVMediaTimelineControlConfiguration currentValueVisualEffect](self, "currentValueVisualEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlConfiguration setCurrentValueVisualEffect:](v4, "setCurrentValueVisualEffect:", v6);

  -[AVMediaTimelineControlConfiguration maxValueVisualEffect](self, "maxValueVisualEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlConfiguration setMaxValueVisualEffect:](v4, "setMaxValueVisualEffect:", v7);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxValueVisualEffect, 0);
  objc_storeStrong((id *)&self->_currentValueVisualEffect, 0);
  objc_storeStrong((id *)&self->_labelsConfiguration, 0);
}

+ (id)defaultConfiguration
{
  AVMediaTimelineControlConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(AVMediaTimelineControlConfiguration);
  +[AVMediaTimelineControlLabelsConfiguration inlineConfiguration](AVMediaTimelineControlLabelsConfiguration, "inlineConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlConfiguration setLabelsConfiguration:](v2, "setLabelsConfiguration:", v3);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlConfiguration setCurrentValueVisualEffect:](v2, "setCurrentValueVisualEffect:", v4);

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControlConfiguration setMaxValueVisualEffect:](v2, "setMaxValueVisualEffect:", v5);

  return v2;
}

@end

@implementation CDRichComplicationTemplateView

- (int64_t)tritiumUpdateMode
{
  return 2;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  return 1;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_template, a3);
  objc_msgSend(v11, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDB8690]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    self->_templateWantsPlatter = 1;
  }
  else
  {
    objc_msgSend(v11, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDB8688]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_templateWantsPlatter = v10 != 0;

  }
  -[CDRichComplicationTemplateView _handleTemplate:reason:](self, "_handleTemplate:reason:", v11, a4);
  -[CDRichComplicationTemplateView setNeedsLayout](self, "setNeedsLayout");

}

- (id)complicationTemplate
{
  return self->_template;
}

- (unint64_t)timelineAnimationFadeTypeOverride
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CLKComplicationTemplate metadata](self->_template, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NTKComplicationTimelineAnimationFadeType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  CLKComplicationTemplate *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDRichComplicationTemplateView;
  -[CDRichComplicationView setTimeTravelDate:animated:](&v6, sel_setTimeTravelDate_animated_, a3, a4);
  v5 = self->_template;
  if (v5)
    -[CDRichComplicationTemplateView setComplicationTemplate:reason:](self, "setComplicationTemplate:reason:", v5, 0);
}

- (CLKComplicationTemplate)template
{
  return self->_template;
}

- (BOOL)templateWantsPlatter
{
  return self->_templateWantsPlatter;
}

- (void)setTemplateWantsPlatter:(BOOL)a3
{
  self->_templateWantsPlatter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_template, 0);
}

@end

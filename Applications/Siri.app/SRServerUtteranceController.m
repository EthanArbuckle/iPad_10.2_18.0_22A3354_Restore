@implementation SRServerUtteranceController

- (void)setAceObject:(id)a3
{
  id v4;
  SRServerUtteranceView *utteranceView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRServerUtteranceController;
  v4 = a3;
  -[SRServerUtteranceController setAceObject:](&v6, "setAceObject:", v4);
  -[SRServerUtteranceController _loadFromObject:](self, "_loadFromObject:", v4, v6.receiver, v6.super_class);

  utteranceView = self->_utteranceView;
  if (utteranceView)
    -[SRServerUtteranceView setText:](utteranceView, "setText:", self->_utterance);
}

- (void)_loadFromObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *utterance;
  uint64_t v10;
  uint64_t v11;
  char isKindOfClass;
  NSString *v13;
  NSString *utterancePrefix;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFUIUtilities parsedUtteranceFromText:context:](AFUIUtilities, "parsedUtteranceFromText:context:", v5, v6));

  v8 = (NSString *)objc_msgSend(v7, "copy");
  utterance = self->_utterance;
  self->_utterance = v8;

  objc_opt_class(SAUIAssistantTipView, v10);
  isKindOfClass = objc_opt_isKindOfClass(v4, v11);
  self->_isTip = isKindOfClass & 1;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tipPrefix"));
    utterancePrefix = self->_utterancePrefix;
    self->_utterancePrefix = v13;

  }
  v15 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dialogIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v19 = 136315650;
    v20 = "-[SRServerUtteranceController _loadFromObject:]";
    v21 = 2112;
    v22 = v17;
    v23 = 2112;
    v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s dialogIdentifier:%@ utterance:%@", (uint8_t *)&v19, 0x20u);

  }
}

- (void)loadView
{
  _BOOL4 isTip;
  SRServerUtteranceView *v4;
  SRServerUtteranceView *utteranceView;
  SRServerUtteranceView *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  SRServerUtteranceView *v13;
  void *v14;

  if (!self->_utteranceView)
  {
    isTip = self->_isTip;
    v4 = -[SRServerUtteranceView initWithFrame:]([SRServerUtteranceView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    utteranceView = self->_utteranceView;
    self->_utteranceView = v4;

    v6 = self->_utteranceView;
    if (isTip)
    {
      -[SRServerUtteranceView setBlendEffectEnabled:](self->_utteranceView, "setBlendEffectEnabled:", 1);
      if (-[NSString length](self->_utterancePrefix, "length"))
      {
        v7 = objc_alloc((Class)NSMutableAttributedString);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_utterancePrefix, "stringByAppendingString:", self->_utterance));
        v9 = objc_msgSend(v7, "initWithString:", v8);

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverTipPrefixFont](UIFont, "siriui_serverTipPrefixFont"));
        objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v10, 0, -[NSString length](self->_utterancePrefix, "length"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverTipFont](UIFont, "siriui_serverTipFont"));
        objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v11, -[NSString length](self->_utterancePrefix, "length"), -[NSString length](self->_utterance, "length"));

        -[SRServerUtteranceView setAttributedText:](self->_utteranceView, "setAttributedText:", v9);
LABEL_8:
        -[SRServerUtteranceController setView:](self, "setView:", self->_utteranceView);
        return;
      }
      v13 = self->_utteranceView;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverTipFont](UIFont, "siriui_serverTipFont"));
      -[SRServerUtteranceView setFont:](v13, "setFont:", v14);

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](UIFont, "siriui_serverUtteranceFont"));
      -[SRServerUtteranceView setFont:](v6, "setFont:", v12);

      -[SRServerUtteranceView setBlendEffectEnabled:](self->_utteranceView, "setBlendEffectEnabled:", 0);
    }
    -[SRServerUtteranceView setText:](self->_utteranceView, "setText:", self->_utterance);
    goto LABEL_8;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  unsigned int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SRServerUtteranceController;
  -[SRServerUtteranceController viewDidAppear:](&v8, "viewDidAppear:", a3);
  if (!-[SRServerUtteranceView chevronHasBeenShown](self->_utteranceView, "chevronHasBeenShown"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRServerUtteranceController delegate](self, "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "shouldEnableInteractionForSiriViewController:");

    if ((v5 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRServerUtteranceController delegate](self, "delegate"));
      v7 = objc_msgSend(v6, "shouldEnableInteractionForSiriViewController:", self);

      if (v7)
        -[SRServerUtteranceController setUtteranceUserInteractionEnabled:](self, "setUtteranceUserInteractionEnabled:", 1);
    }
  }
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SRServerUtteranceController;
  v3 = -[SRServerUtteranceController description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(", %@"), self->_utterance));

  return v5;
}

- (double)desiredHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRServerUtteranceController view](self, "view"));
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  v6 = v5;

  return v6;
}

- (double)baselineOffsetFromBottom
{
  double result;

  -[SRServerUtteranceView baselineOffsetFromBottom](self->_utteranceView, "baselineOffsetFromBottom");
  return result;
}

- (double)_extendedTopPadding
{
  uint64_t v2;
  double v3;
  void *v4;
  double v5;
  double v6;

  if (self->_isTip)
  {
    *(double *)&v2 = 56.0;
LABEL_5:
    v3 = *(double *)&v2;
    goto LABEL_9;
  }
  if ((SiriUIIsCompactWidth(self, a2) & 1) != 0)
  {
    *(double *)&v2 = 62.0;
    goto LABEL_5;
  }
  if (SiriUIIsCompactHeight())
    v3 = 62.0;
  else
    v3 = 94.0;
LABEL_9:
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](UIFont, "siriui_serverUtteranceFont"));
  objc_msgSend(v4, "_scaledValueForValue:", v3);
  v6 = v5;

  return v6;
}

- (double)_scaledTopPadding
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](UIFont, "siriui_serverUtteranceFont"));
  objc_msgSend(v2, "_scaledValueForValue:", 42.0);
  v4 = v3;

  return v4;
}

- (BOOL)_shouldSkipAnimationsInAlternateSpeeds
{
  return 1;
}

- (int64_t)_pinAnimationType
{
  return 2;
}

- (int64_t)_insertionAnimation
{
  return 1;
}

- (int64_t)_replacementAnimation
{
  return 2;
}

- (double)_insertionAnimatedZPosition
{
  double result;

  +[SRServerUtteranceView insertionAnimatedZPosition](SRServerUtteranceView, "insertionAnimatedZPosition");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterancePrefix, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_utteranceView, 0);
}

@end

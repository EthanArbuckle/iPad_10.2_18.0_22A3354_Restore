@implementation AccessibilityFeatureCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache speakScreen](self, "speakScreen"), CFSTR("speakScreen"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache liveCaptions](self, "liveCaptions"), CFSTR("liveCaptions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache liveSpeech](self, "liveSpeech"), CFSTR("liveSpeech"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache zoom](self, "zoom"), CFSTR("zoom"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache voiceControl](self, "voiceControl"), CFSTR("voiceControl"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache backTap](self, "backTap"), CFSTR("backTap"));
  -[AccessibilityFeatureCache tripleClickOptions](self, "tripleClickOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tripleClickOptions"));

}

- (AccessibilityFeatureCache)initWithCoder:(id)a3
{
  id v3;
  AccessibilityFeatureCache *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AccessibilityFeatureCache;
  v3 = a3;
  v4 = -[AccessibilityFeatureCache init](&v7, sel_init);
  -[AccessibilityFeatureCache setSpeakScreen:](v4, "setSpeakScreen:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("speakScreen"), v7.receiver, v7.super_class));
  -[AccessibilityFeatureCache setLiveCaptions:](v4, "setLiveCaptions:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("liveCaptions")));
  -[AccessibilityFeatureCache setLiveSpeech:](v4, "setLiveSpeech:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("liveSpeech")));
  -[AccessibilityFeatureCache setZoom:](v4, "setZoom:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("zoom")));
  -[AccessibilityFeatureCache setVoiceControl:](v4, "setVoiceControl:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("voiceControl")));
  -[AccessibilityFeatureCache setBackTap:](v4, "setBackTap:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("backTap")));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tripleClickOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AccessibilityFeatureCache setTripleClickOptions:](v4, "setTripleClickOptions:", v5);
  return v4;
}

- (BOOL)speakScreen
{
  return self->_speakScreen;
}

- (void)setSpeakScreen:(BOOL)a3
{
  self->_speakScreen = a3;
}

- (BOOL)liveCaptions
{
  return self->_liveCaptions;
}

- (void)setLiveCaptions:(BOOL)a3
{
  self->_liveCaptions = a3;
}

- (BOOL)assistiveTouch
{
  return self->_assistiveTouch;
}

- (void)setAssistiveTouch:(BOOL)a3
{
  self->_assistiveTouch = a3;
}

- (BOOL)liveSpeech
{
  return self->_liveSpeech;
}

- (void)setLiveSpeech:(BOOL)a3
{
  self->_liveSpeech = a3;
}

- (BOOL)zoom
{
  return self->_zoom;
}

- (void)setZoom:(BOOL)a3
{
  self->_zoom = a3;
}

- (BOOL)voiceControl
{
  return self->_voiceControl;
}

- (void)setVoiceControl:(BOOL)a3
{
  self->_voiceControl = a3;
}

- (BOOL)backTap
{
  return self->_backTap;
}

- (void)setBackTap:(BOOL)a3
{
  self->_backTap = a3;
}

- (NSArray)tripleClickOptions
{
  return self->_tripleClickOptions;
}

- (void)setTripleClickOptions:(id)a3
{
  objc_storeStrong((id *)&self->_tripleClickOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripleClickOptions, 0);
}

@end

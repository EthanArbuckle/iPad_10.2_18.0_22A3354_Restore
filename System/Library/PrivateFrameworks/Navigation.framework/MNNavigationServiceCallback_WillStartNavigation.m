@implementation MNNavigationServiceCallback_WillStartNavigation

- (unint64_t)type
{
  return 15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t navigationType;
  id v5;

  navigationType = self->_navigationType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", navigationType, CFSTR("_navigationType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_simulationType, CFSTR("_simulationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routeInfo, CFSTR("_routeInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_initialRouteSource, CFSTR("_initialRouteSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceLanguage, CFSTR("_voiceLanguage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isResumingMultiStopRoute, CFSTR("_isResumingMultiStopRoute"));

}

- (MNNavigationServiceCallback_WillStartNavigation)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_WillStartNavigation *v5;
  uint64_t v6;
  MNActiveRouteInfo *routeInfo;
  uint64_t v8;
  NSString *voiceLanguage;
  MNNavigationServiceCallback_WillStartNavigation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNNavigationServiceCallback_WillStartNavigation;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_navigationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_navigationType"));
    v5->_simulationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_simulationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    routeInfo = v5->_routeInfo;
    v5->_routeInfo = (MNActiveRouteInfo *)v6;

    v5->_initialRouteSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_initialRouteSource"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voiceLanguage"));
    v8 = objc_claimAutoreleasedReturnValue();
    voiceLanguage = v5->_voiceLanguage;
    v5->_voiceLanguage = (NSString *)v8;

    v5->_isResumingMultiStopRoute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isResumingMultiStopRoute"));
    v10 = v5;
  }

  return v5;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(int64_t)a3
{
  self->_navigationType = a3;
}

- (int64_t)simulationType
{
  return self->_simulationType;
}

- (void)setSimulationType:(int64_t)a3
{
  self->_simulationType = a3;
}

- (MNActiveRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (void)setRouteInfo:(id)a3
{
  objc_storeStrong((id *)&self->_routeInfo, a3);
}

- (unint64_t)initialRouteSource
{
  return self->_initialRouteSource;
}

- (void)setInitialRouteSource:(unint64_t)a3
{
  self->_initialRouteSource = a3;
}

- (NSString)voiceLanguage
{
  return self->_voiceLanguage;
}

- (void)setVoiceLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isResumingMultiStopRoute
{
  return self->_isResumingMultiStopRoute;
}

- (void)setIsResumingMultiStopRoute:(BOOL)a3
{
  self->_isResumingMultiStopRoute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
}

@end

@implementation _LTSELFLoggingTranslateAppContext

- (_LTSELFLoggingTranslateAppContext)initWithDisplayMode:(int64_t)a3 localePair:(id)a4 isGenderAlternativeEnabled:(BOOL)a5 tabName:(int64_t)a6 tabSessionId:(id)a7 conversationTabView:(int64_t)a8 isPlayTranslationsEnabled:(BOOL)a9 autoTranslateSessionId:(id)a10 audioChannel:(int64_t)a11 languageIdentificationEnabled:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  _LTSELFLoggingTranslateAppContext *v21;
  _LTSELFLoggingTranslateAppContext *v22;
  _LTSELFLoggingTranslateAppContext *v23;
  objc_super v26;

  v18 = a4;
  v19 = a7;
  v20 = a10;
  v26.receiver = self;
  v26.super_class = (Class)_LTSELFLoggingTranslateAppContext;
  v21 = -[_LTSELFLoggingTranslateAppContext init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_displayMode = a3;
    objc_storeStrong((id *)&v21->_localePair, a4);
    v22->_isGenderAlternativeEnabled = a5;
    v22->_tabName = a6;
    objc_storeStrong((id *)&v22->_tabSessionId, a7);
    v22->_conversationTabView = a8;
    v22->_isPlayTranslationsEnabled = a9;
    objc_storeStrong((id *)&v22->_autoTranslateSessionId, a10);
    v22->_audioChannel = a11;
    v22->_languageIdentificationEnabled = a12;
    v23 = v22;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t displayMode;
  id v5;

  displayMode = self->_displayMode;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", displayMode, CFSTR("displayMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localePair, CFSTR("localePair"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isGenderAlternativeEnabled, CFSTR("isGenderAlternativeEnabled"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tabName, CFSTR("tabName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tabSessionId, CFSTR("tabSessionId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_conversationTabView, CFSTR("conversationTabView"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPlayTranslationsEnabled, CFSTR("isPlayTranslationsEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_autoTranslateSessionId, CFSTR("autoTranslateSessionId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_audioChannel, CFSTR("audioChannel"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_languageIdentificationEnabled, CFSTR("languageIdentificationEnabled"));

}

- (_LTSELFLoggingTranslateAppContext)initWithCoder:(id)a3
{
  id v4;
  _LTSELFLoggingTranslateAppContext *v5;
  uint64_t v6;
  _LTLocalePair *localePair;
  uint64_t v8;
  NSUUID *tabSessionId;
  uint64_t v10;
  NSUUID *autoTranslateSessionId;
  _LTSELFLoggingTranslateAppContext *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_LTSELFLoggingTranslateAppContext;
  v5 = -[_LTSELFLoggingTranslateAppContext init](&v14, sel_init);
  if (v5)
  {
    v5->_displayMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localePair"));
    v6 = objc_claimAutoreleasedReturnValue();
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v6;

    v5->_isGenderAlternativeEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGenderAlternativeEnabled"));
    v5->_tabName = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tabName"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tabSessionId"));
    v8 = objc_claimAutoreleasedReturnValue();
    tabSessionId = v5->_tabSessionId;
    v5->_tabSessionId = (NSUUID *)v8;

    v5->_conversationTabView = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("conversationTabView"));
    v5->_isPlayTranslationsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPlayTranslationsEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoTranslateSessionId"));
    v10 = objc_claimAutoreleasedReturnValue();
    autoTranslateSessionId = v5->_autoTranslateSessionId;
    v5->_autoTranslateSessionId = (NSUUID *)v10;

    v5->_audioChannel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("audioChannel"));
    v5->_languageIdentificationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("languageIdentificationEnabled"));
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (BOOL)isGenderAlternativeEnabled
{
  return self->_isGenderAlternativeEnabled;
}

- (int64_t)tabName
{
  return self->_tabName;
}

- (NSUUID)tabSessionId
{
  return self->_tabSessionId;
}

- (int64_t)conversationTabView
{
  return self->_conversationTabView;
}

- (BOOL)isPlayTranslationsEnabled
{
  return self->_isPlayTranslationsEnabled;
}

- (NSUUID)autoTranslateSessionId
{
  return self->_autoTranslateSessionId;
}

- (int64_t)audioChannel
{
  return self->_audioChannel;
}

- (void)setAudioChannel:(int64_t)a3
{
  self->_audioChannel = a3;
}

- (BOOL)languageIdentificationEnabled
{
  return self->_languageIdentificationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoTranslateSessionId, 0);
  objc_storeStrong((id *)&self->_tabSessionId, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
}

@end

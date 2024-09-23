@implementation _AFInterstitialAction

- (_AFInterstitialAction)initWithPhase:(int64_t)a3 displayKey:(id)a4 speakableKey:(id)a5
{
  id v8;
  id v9;
  _AFInterstitialAction *v10;
  _AFInterstitialAction *v11;
  uint64_t v12;
  NSString *displayKey;
  uint64_t v14;
  NSString *speakableKey;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_AFInterstitialAction;
  v10 = -[_AFInterstitialAction init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_phase = a3;
    v12 = objc_msgSend(v8, "copy");
    displayKey = v11->_displayKey;
    v11->_displayKey = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    speakableKey = v11->_speakableKey;
    v11->_speakableKey = (NSString *)v14;

  }
  return v11;
}

- (_AFInterstitialAction)initWithDuration:(double)a3
{
  _AFInterstitialAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_AFInterstitialAction;
  result = -[_AFInterstitialAction init](&v5, sel_init);
  if (result)
    result->_duration = a3;
  return result;
}

- (int64_t)phase
{
  return self->_phase;
}

- (NSString)displayKey
{
  return self->_displayKey;
}

- (NSString)speakableKey
{
  return self->_speakableKey;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableKey, 0);
  objc_storeStrong((id *)&self->_displayKey, 0);
}

@end

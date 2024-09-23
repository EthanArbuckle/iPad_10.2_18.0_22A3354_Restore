@implementation AKBiometricRatchetContext

- (AKBiometricRatchetContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 fallbackToNoAuth:(BOOL)a6 useShortExpiration:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  AKBiometricRatchetContext *v16;
  AKBiometricRatchetContext *v17;
  NSString *beginRatchetTitle;
  NSString *beginRatchetBody;
  NSString *countdownText;
  NSString *findMyErrorTitle;
  NSString *findMyErrorMessage;
  NSString *metaContext;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v25.receiver = self;
  v25.super_class = (Class)AKBiometricRatchetContext;
  v16 = -[AKBiometricRatchetContext init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_reason, a3);
    objc_storeStrong((id *)&v17->_calloutReason, a4);
    objc_storeStrong((id *)&v17->_deeplinkURL, a5);
    v17->_fallbackToNoAuth = a6;
    v17->_useShortExpiration = a7;
    v17->_showsLocationWarning = 0;
    beginRatchetTitle = v17->_beginRatchetTitle;
    v17->_beginRatchetTitle = 0;

    beginRatchetBody = v17->_beginRatchetBody;
    v17->_beginRatchetBody = 0;

    countdownText = v17->_countdownText;
    v17->_countdownText = 0;

    findMyErrorTitle = v17->_findMyErrorTitle;
    v17->_findMyErrorTitle = 0;

    findMyErrorMessage = v17->_findMyErrorMessage;
    v17->_findMyErrorMessage = 0;

    metaContext = v17->_metaContext;
    v17->_metaContext = 0;

  }
  return v17;
}

- (AKBiometricRatchetContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 fallbackToNoAuth:(BOOL)a6 useShortExpiration:(BOOL)a7 beginRatchetTitle:(id)a8 beginRatchetBody:(id)a9 showsLocationWarning:(BOOL)a10 countdownText:(id)a11 findMyErrorTitle:(id)a12 findMyErrorMessage:(id)a13 metaContext:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  AKBiometricRatchetContext *v25;
  AKBiometricRatchetContext *v26;
  id obj;
  id v29;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v32 = a3;
  obj = a4;
  v19 = a4;
  v29 = a5;
  v20 = a5;
  v34 = a8;
  v33 = a9;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  v35.receiver = self;
  v35.super_class = (Class)AKBiometricRatchetContext;
  v25 = -[AKBiometricRatchetContext init](&v35, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_reason, a3);
    objc_storeStrong((id *)&v26->_calloutReason, obj);
    objc_storeStrong((id *)&v26->_deeplinkURL, v29);
    v26->_fallbackToNoAuth = a6;
    v26->_useShortExpiration = a7;
    objc_storeStrong((id *)&v26->_beginRatchetTitle, a8);
    objc_storeStrong((id *)&v26->_beginRatchetBody, a9);
    v26->_showsLocationWarning = a10;
    objc_storeStrong((id *)&v26->_countdownText, a11);
    objc_storeStrong((id *)&v26->_findMyErrorTitle, a12);
    objc_storeStrong((id *)&v26->_findMyErrorMessage, a13);
    objc_storeStrong((id *)&v26->_metaContext, a14);
  }

  return v26;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  NSString *reason;
  NSString *calloutReason;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  reason = self->_reason;
  calloutReason = self->_calloutReason;
  -[NSURL absoluteString](self->_deeplinkURL, "absoluteString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("YES");
  if (self->_fallbackToNoAuth)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_useShortExpiration)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (!self->_showsLocationWarning)
    v9 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> \n\treason: %@,\n\tcalloutReason: %@,\n\tdeeplinkURL: %@,\n\tfallbackToNoAuth: %@,\n\tseShortExpiration: %@,\n\tbeginRatchetTitle: %@,\n\tbeginRatchetBody: %@,\n\tshowsLocationWarning: %@,\n\tcountdownText: %@,\n\tfindMyErrorTitle: %@,\n\tfindMyErrorMessage: %@,\n"), v4, self, reason, calloutReason, v7, v10, v11, self->_beginRatchetTitle, self->_beginRatchetBody, v9, self->_countdownText, self->_findMyErrorTitle, self->_findMyErrorMessage);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)calloutReason
{
  return self->_calloutReason;
}

- (NSURL)deeplinkURL
{
  return self->_deeplinkURL;
}

- (BOOL)fallbackToNoAuth
{
  return self->_fallbackToNoAuth;
}

- (BOOL)useShortExpiration
{
  return self->_useShortExpiration;
}

- (NSString)beginRatchetTitle
{
  return self->_beginRatchetTitle;
}

- (NSString)beginRatchetBody
{
  return self->_beginRatchetBody;
}

- (BOOL)showsLocationWarning
{
  return self->_showsLocationWarning;
}

- (NSString)countdownText
{
  return self->_countdownText;
}

- (NSString)findMyErrorTitle
{
  return self->_findMyErrorTitle;
}

- (NSString)findMyErrorMessage
{
  return self->_findMyErrorMessage;
}

- (NSString)metaContext
{
  return self->_metaContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContext, 0);
  objc_storeStrong((id *)&self->_findMyErrorMessage, 0);
  objc_storeStrong((id *)&self->_findMyErrorTitle, 0);
  objc_storeStrong((id *)&self->_countdownText, 0);
  objc_storeStrong((id *)&self->_beginRatchetBody, 0);
  objc_storeStrong((id *)&self->_beginRatchetTitle, 0);
  objc_storeStrong((id *)&self->_deeplinkURL, 0);
  objc_storeStrong((id *)&self->_calloutReason, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end

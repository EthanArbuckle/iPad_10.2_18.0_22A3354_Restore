@implementation INAnswerCallIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INAnswerCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INAnswerCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INAnswerCallIntent)initWithAudioRoute:(INCallAudioRoute)audioRoute callIdentifier:(NSString *)callIdentifier
{
  NSString *v6;
  INAnswerCallIntent *v7;
  INAnswerCallIntent *v8;
  objc_super v10;

  v6 = callIdentifier;
  v10.receiver = self;
  v10.super_class = (Class)INAnswerCallIntent;
  v7 = -[INIntent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[INAnswerCallIntent setAudioRoute:](v7, "setAudioRoute:", audioRoute);
    -[INAnswerCallIntent setCallIdentifier:](v8, "setCallIdentifier:", v6);
  }

  return v8;
}

- (INCallAudioRoute)audioRoute
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  INCallAudioRoute v7;

  -[INAnswerCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAudioRoute");
  -[INAnswerCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "audioRoute");
  if (v4 && (v6 - 2) <= 2)
    v7 = qword_18C311CB0[v6 - 2];
  else
    v7 = INCallAudioRouteUnknown;

  return v7;
}

- (void)setAudioRoute:(int64_t)a3
{
  uint64_t v3;
  id v4;

  switch(a3)
  {
    case 1:
      v3 = 2;
      break;
    case 1000:
      v3 = 4;
      break;
    case 2:
      v3 = 3;
      break;
    default:
      -[INAnswerCallIntent _typedBackingStore](self, "_typedBackingStore");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHasAudioRoute:", 0);
      goto LABEL_9;
  }
  -[INAnswerCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioRoute:", v3);
LABEL_9:

}

- (NSString)callIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INAnswerCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setCallIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INAnswerCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCallIdentifier:", v4);

}

- (id)_dictionaryRepresentation
{
  INCallAudioRoute v3;
  __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("audioRoute");
  v3 = -[INAnswerCallIntent audioRoute](self, "audioRoute");
  v4 = CFSTR("speakerphoneAudioRoute");
  v5 = CFSTR("heySiriAudioRoute");
  v6 = CFSTR("unknown");
  if (v3 == INCallAudioRouteBluetoothAudioRoute)
    v6 = CFSTR("bluetoothAudioRoute");
  if (v3 != 1000)
    v5 = v6;
  if (v3 != INCallAudioRouteSpeakerphoneAudioRoute)
    v4 = (__CFString *)v5;
  v7 = v4;
  v12[1] = CFSTR("callIdentifier");
  v13[0] = v7;
  -[INAnswerCallIntent callIdentifier](self, "callIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  return v10;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INAnswerCallIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Calls");
}

- (id)verb
{
  return CFSTR("AnswerCall");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INAnswerCallIntent)initWithAudioRoute:(int64_t)a3
{
  return -[INAnswerCallIntent initWithAudioRoute:callIdentifier:](self, "initWithAudioRoute:callIdentifier:", a3, 0);
}

@end

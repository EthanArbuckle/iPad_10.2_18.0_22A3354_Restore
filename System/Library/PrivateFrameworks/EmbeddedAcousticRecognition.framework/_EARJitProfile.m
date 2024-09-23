@implementation _EARJitProfile

- (_EARJitProfile)initWithConfiguration:(id)a3 ncsRoot:(id)a4 language:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EARJitProfile *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _EARUserProfile *v16;
  _EARUserProfileBuilder *profileBuilder;
  _EARUserProfileBuilder *v18;
  _EARJitProfile *v19;
  uint64_t v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_EARJitProfile;
  v11 = -[_EARJitProfile init](&v22, sel_init);
  if (!v11)
    goto LABEL_3;
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("en_US_napg.json"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("vocdelta.voc"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("pg.voc"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("mrec.psh"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 1;
  v16 = -[_EARUserProfileBuilder initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:]([_EARUserProfile alloc], "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:", v8, v10, 0, v12, v13, v14, v15, v21);
  profileBuilder = v11->_profileBuilder;
  v11->_profileBuilder = &v16->super;

  v18 = v11->_profileBuilder;
  if (!v18)
    v19 = 0;
  else
LABEL_3:
    v19 = v11;

  return v19;
}

- (id)jitProfileFromContextualStrings:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_EARUserProfileBuilder createInlineLmeUserDataForContextStrings:](self->_profileBuilder, "createInlineLmeUserDataForContextStrings:", v4);
  -[_EARUserProfileBuilder dataProfile](self->_profileBuilder, "dataProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileBuilder, 0);
}

@end

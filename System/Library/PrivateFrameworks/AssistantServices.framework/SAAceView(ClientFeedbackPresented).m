@implementation SAAceView(ClientFeedbackPresented)

- (uint64_t)_af_dialogPhase
{
  return 0;
}

- (uint64_t)_af_dialogIdentifier
{
  return 0;
}

- (void)_af_enumerateClientFeedbackDetails:()ClientFeedbackPresented
{
  void (**v4)(id, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _BYTE v11[40];
  id v12[4];
  char v13;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_af_dialogPhase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_af_dialogIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "aceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encodedClassName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "listenAfterSpeaking");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v5 || v6 || v7)
    {
      v12[0] = v7;
      v12[1] = v8;
      v12[3] = v6;
      v12[2] = v5;
      v13 = v10;
      __copy_constructor_8_8_s0_s8_s16_s24_t32w1((uint64_t)v11, (uint64_t)v12);
      v4[2](v4, v11);
      __destructor_8_s0_s8_s16_s24(v12);
    }

  }
}

@end

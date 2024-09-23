@implementation SAUISayIt(ClientFeedbackPresented)

- (void)_af_enumerateClientFeedbackDetails:()ClientFeedbackPresented
{
  void (**v4)(id, _BYTE *);
  void *v5;
  _BYTE v6[40];
  id v7[3];
  uint64_t v8;
  char v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "aceId");
    v7[0] = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encodedClassName");
    v7[1] = (id)objc_claimAutoreleasedReturnValue();
    v7[2] = 0;
    objc_msgSend(a1, "dialogIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "listenAfterSpeaking");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "BOOLValue");

    if ((unint64_t)v7[0] | v8)
    {
      __copy_constructor_8_8_s0_s8_s16_s24_t32w1((uint64_t)v6, (uint64_t)v7);
      v4[2](v4, v6);
    }
    __destructor_8_s0_s8_s16_s24(v7);
  }

}

@end

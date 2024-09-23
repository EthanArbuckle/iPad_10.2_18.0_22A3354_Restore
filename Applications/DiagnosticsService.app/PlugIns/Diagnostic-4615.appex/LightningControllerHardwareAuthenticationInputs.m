@implementation LightningControllerHardwareAuthenticationInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if (-[LightningControllerHardwareAuthenticationInputs _applyChallengeParameter:](self, "_applyChallengeParameter:", v4))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = !-[LightningControllerHardwareAuthenticationInputs _applyKeyIndexParameter:](self, "_applyKeyIndexParameter:", v4);
  }

  return v5;
}

- (BOOL)_applyChallengeParameter:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  char v9;

  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("challenge"), 256, &v9));
  if (v9)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v4, 0);
    -[LightningControllerHardwareAuthenticationInputs setChallenge:](self, "setChallenge:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LightningControllerHardwareAuthenticationInputs challenge](self, "challenge"));
    if (v7)
    {
      v5 = v9 != 0;
    }
    else
    {
      v5 = 1;
      v9 = 1;
    }
  }

  return v5;
}

- (BOOL)_applyKeyIndexParameter:(id)a3
{
  void *v4;
  BOOL v6;

  v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("keyIndex"), &off_1000042F0, &off_100004308, &off_1000042F0, &v6));
  -[LightningControllerHardwareAuthenticationInputs setKeyIndex:](self, "setKeyIndex:", objc_msgSend(v4, "intValue"));

  return v6;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (int)keyIndex
{
  return self->_keyIndex;
}

- (void)setKeyIndex:(int)a3
{
  self->_keyIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end

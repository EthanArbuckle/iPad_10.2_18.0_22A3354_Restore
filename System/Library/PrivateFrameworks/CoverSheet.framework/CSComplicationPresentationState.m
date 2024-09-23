@implementation CSComplicationPresentationState

- (_BYTE)initWithVisibility:(char)a3 isScreenOff:(uint64_t)a4 backlightLuminance:(uint64_t)a5 interfaceOrientation:
{
  _BYTE *v9;
  _BYTE *v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)CSComplicationPresentationState;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[8] = a2;
    v9[9] = a3;
    *((_QWORD *)v9 + 2) = a4;
    *((_QWORD *)v9 + 3) = a5;
    objc_msgSend(v9, "_hydrateSuggestedPresentationMode");
  }
  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  unint64_t suggestedComplicationPresentationMode;
  const __CFString *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_presenterVisible, CFSTR("isPresenterVisible"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_screenOff, CFSTR("isScreenOff"));
  v6 = self->_backlightLuminance + 1;
  if (v6 > 3)
    v7 = CFSTR("Invalid Backlight Luminance specified");
  else
    v7 = off_1E8E302A0[v6];
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("_backlightLuminance"));
  SBFStringForBSInterfaceOrientation();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("_interfaceOrientation"));

  suggestedComplicationPresentationMode = self->_suggestedComplicationPresentationMode;
  if (suggestedComplicationPresentationMode > 3)
    v10 = CFSTR("Invalid Mode Defined");
  else
    v10 = off_1E8E302C0[suggestedComplicationPresentationMode];
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("suggestedPortraitPresentationMode"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", self->_shouldPresentLandscapeComplications, CFSTR("shouldPresentLandscapeComplications"));
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)suggestedComplicationPresentationMode
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CSComplicationPresentationState *v4;
  CSComplicationPresentationState *v5;
  char v6;

  v4 = (CSComplicationPresentationState *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[CSComplicationPresentationState isEqualToComplicationPresentationState:]((uint64_t)self, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)isEqualToComplicationPresentationState:(uint64_t)a1
{
  _BYTE *v3;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    if (v3)
    {
      if ((v3[8] != 0) != (*(_BYTE *)(a1 + 8) != 0)
        || *((_QWORD *)v3 + 2) != *(_QWORD *)(a1 + 16)
        || (v3[9] != 0) != (*(_BYTE *)(a1 + 9) != 0))
      {
LABEL_6:
        a1 = 0;
        goto LABEL_7;
      }
      v5 = *((_QWORD *)v3 + 3);
    }
    else
    {
      if (*(_BYTE *)(a1 + 8) || *(_QWORD *)(a1 + 16) || *(_BYTE *)(a1 + 9))
        goto LABEL_6;
      v5 = 0;
    }
    a1 = v5 == *(_QWORD *)(a1 + 24);
  }
LABEL_7:

  return a1;
}

- (BOOL)isPresenterVisible
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (uint64_t)backlightLuminance
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (BOOL)isScreenOff
{
  if (result)
    return *(_BYTE *)(result + 9) != 0;
  return result;
}

- (uint64_t)interfaceOrientation
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void)_hydrateSuggestedPresentationMode
{
  int64_t backlightLuminance;
  _BOOL4 screenOff;
  _BOOL4 presenterVisible;
  void *v6;
  int v7;
  unint64_t v8;

  if (self)
  {
    backlightLuminance = self->_backlightLuminance;
    screenOff = self->_screenOff;
    presenterVisible = self->_presenterVisible;
  }
  else
  {
    screenOff = 0;
    backlightLuminance = 0;
    presenterVisible = 0;
  }
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceClass");

  if (presenterVisible && backlightLuminance >= 1)
    v8 = 2;
  else
    v8 = 1;
  self->_suggestedComplicationPresentationMode = v8;
  self->_shouldPresentLandscapeComplications = BSInterfaceOrientationIsLandscape()
                                            && v7 == 2
                                            && !screenOff
                                            && self->_suggestedComplicationPresentationMode == 2;
}

- (BOOL)shouldPresentLandscapeComplications
{
  if (result)
    return *(_BYTE *)(result + 10) != 0;
  return result;
}

@end

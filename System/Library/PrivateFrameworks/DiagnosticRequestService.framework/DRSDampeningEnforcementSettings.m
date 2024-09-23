@implementation DRSDampeningEnforcementSettings

- (DRSDampeningEnforcementSettings)init
{
  DRSDampeningEnforcementSettings *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DRSDampeningEnforcementSettings;
  result = -[DRSDampeningEnforcementSettings init](&v3, sel_init);
  if (result)
  {
    *(_DWORD *)&result->_enforcesSignatureHysteresis = 16843009;
    *(_DWORD *)&result->_enforcesResourceHysteresis = 16843009;
  }
  return result;
}

- (id)jsonCompatibleDictRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("EnforceResourceHysteresis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesResourceHysteresis](self, "enforcesResourceHysteresis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("EnforceResourceCap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesResourceCap](self, "enforcesResourceCap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("EnforceResourceDownsampling");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesResourceDownsampling](self, "enforcesResourceDownsampling"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("EnforceSignatureHysteresis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesSignatureHysteresis](self, "enforcesSignatureHysteresis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("EnforceSignatureCap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesSignatureCap](self, "enforcesSignatureCap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = CFSTR("EnforceSignatureDownsampling");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesSignatureDownsampling](self, "enforcesSignatureDownsampling"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  v12[6] = CFSTR("EnforceTotalCap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesTotalCap](self, "enforcesTotalCap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setAllEnforcement:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[DRSDampeningEnforcementSettings setEnforcesResourceHysteresis:](self, "setEnforcesResourceHysteresis:");
  -[DRSDampeningEnforcementSettings setEnforcesResourceCap:](self, "setEnforcesResourceCap:", v3);
  -[DRSDampeningEnforcementSettings setEnforcesResourceDownsampling:](self, "setEnforcesResourceDownsampling:", v3);
  -[DRSDampeningEnforcementSettings setEnforcesSignatureHysteresis:](self, "setEnforcesSignatureHysteresis:", v3);
  -[DRSDampeningEnforcementSettings setEnforcesSignatureCap:](self, "setEnforcesSignatureCap:", v3);
  -[DRSDampeningEnforcementSettings setEnforcesSignatureDownsampling:](self, "setEnforcesSignatureDownsampling:", v3);
  -[DRSDampeningEnforcementSettings setEnforcesTotalCap:](self, "setEnforcesTotalCap:", v3);
}

- (id)debugDescription
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (-[DRSDampeningEnforcementSettings enforcesResourceHysteresis](self, "enforcesResourceHysteresis"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[DRSDampeningEnforcementSettings enforcesResourceCap](self, "enforcesResourceCap"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[DRSDampeningEnforcementSettings enforcesResourceDownsampling](self, "enforcesResourceDownsampling"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[DRSDampeningEnforcementSettings enforcesSignatureHysteresis](self, "enforcesSignatureHysteresis"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[DRSDampeningEnforcementSettings enforcesSignatureCap](self, "enforcesSignatureCap"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[DRSDampeningEnforcementSettings enforcesSignatureDownsampling](self, "enforcesSignatureDownsampling"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[DRSDampeningEnforcementSettings enforcesTotalCap](self, "enforcesTotalCap"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n"), CFSTR("enforcesResourceHysteresis"), v4, CFSTR("enforcesResourceCap"), v5, CFSTR("enforcesResourceDownsampling"), v6, CFSTR("enforcesSignatureHysteresis"), v7, CFSTR("enforcesSignatureCap"), v8, CFSTR("enforcesSignatureDownsampling"), v9, CFSTR("enforcesTotalCap"), v10);
}

- (BOOL)isEqual:(id)a3
{
  DRSDampeningEnforcementSettings *v4;
  DRSDampeningEnforcementSettings *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v14;

  v4 = (DRSDampeningEnforcementSettings *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DRSDampeningEnforcementSettings enforcesResourceHysteresis](self, "enforcesResourceHysteresis");
      if (v6 == -[DRSDampeningEnforcementSettings enforcesResourceHysteresis](v5, "enforcesResourceHysteresis")
        && (v7 = -[DRSDampeningEnforcementSettings enforcesResourceCap](self, "enforcesResourceCap"),
            v7 == -[DRSDampeningEnforcementSettings enforcesResourceCap](v5, "enforcesResourceCap"))
        && (v8 = -[DRSDampeningEnforcementSettings enforcesResourceDownsampling](self, "enforcesResourceDownsampling"),
            v8 == -[DRSDampeningEnforcementSettings enforcesResourceDownsampling](v5, "enforcesResourceDownsampling"))
        && (v9 = -[DRSDampeningEnforcementSettings enforcesSignatureHysteresis](self, "enforcesSignatureHysteresis"),
            v9 == -[DRSDampeningEnforcementSettings enforcesSignatureHysteresis](v5, "enforcesSignatureHysteresis"))
        && (v10 = -[DRSDampeningEnforcementSettings enforcesSignatureCap](self, "enforcesSignatureCap"),
            v10 == -[DRSDampeningEnforcementSettings enforcesSignatureCap](v5, "enforcesSignatureCap"))
        && (v11 = -[DRSDampeningEnforcementSettings enforcesSignatureDownsampling](self, "enforcesSignatureDownsampling"), v11 == -[DRSDampeningEnforcementSettings enforcesSignatureDownsampling](v5, "enforcesSignatureDownsampling")))
      {
        v14 = -[DRSDampeningEnforcementSettings enforcesTotalCap](self, "enforcesTotalCap");
        v12 = v14 ^ -[DRSDampeningEnforcementSettings enforcesTotalCap](v5, "enforcesTotalCap") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (DRSDampeningEnforcementSettings)initWithMO:(id)a3
{
  id v4;
  DRSDampeningEnforcementSettings *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DRSDampeningEnforcementSettings;
  v5 = -[DRSDampeningEnforcementSettings init](&v7, sel_init);
  if (v5)
  {
    v5->_enforcesResourceHysteresis = objc_msgSend(v4, "enforcesResourceHysteresis");
    v5->_enforcesResourceCap = objc_msgSend(v4, "enforcesResourceCap");
    v5->_enforcesResourceDownsampling = objc_msgSend(v4, "enforcesResourceDownsampling");
    v5->_enforcesSignatureHysteresis = objc_msgSend(v4, "enforcesSignatureHysteresis");
    v5->_enforcesSignatureCap = objc_msgSend(v4, "enforcesSignatureCap");
    v5->_enforcesSignatureDownsampling = objc_msgSend(v4, "enforcesSignatureDownsampling");
    v5->_enforcesTotalCap = objc_msgSend(v4, "enforcesTotalCap");
  }

  return v5;
}

- (id)_moRepresentation:(id)a3
{
  id v4;
  DRSDampeningEnforcementSettingsMO *v5;

  v4 = a3;
  v5 = -[DRSDampeningEnforcementSettingsMO initWithContext:]([DRSDampeningEnforcementSettingsMO alloc], "initWithContext:", v4);

  -[DRSDampeningEnforcementSettingsMO setEnforcesResourceHysteresis:](v5, "setEnforcesResourceHysteresis:", -[DRSDampeningEnforcementSettings enforcesResourceHysteresis](self, "enforcesResourceHysteresis"));
  -[DRSDampeningEnforcementSettingsMO setEnforcesResourceCap:](v5, "setEnforcesResourceCap:", -[DRSDampeningEnforcementSettings enforcesResourceCap](self, "enforcesResourceCap"));
  -[DRSDampeningEnforcementSettingsMO setEnforcesResourceDownsampling:](v5, "setEnforcesResourceDownsampling:", -[DRSDampeningEnforcementSettings enforcesResourceDownsampling](self, "enforcesResourceDownsampling"));
  -[DRSDampeningEnforcementSettingsMO setEnforcesSignatureHysteresis:](v5, "setEnforcesSignatureHysteresis:", -[DRSDampeningEnforcementSettings enforcesSignatureHysteresis](self, "enforcesSignatureHysteresis"));
  -[DRSDampeningEnforcementSettingsMO setEnforcesSignatureCap:](v5, "setEnforcesSignatureCap:", -[DRSDampeningEnforcementSettings enforcesSignatureCap](self, "enforcesSignatureCap"));
  -[DRSDampeningEnforcementSettingsMO setEnforcesSignatureDownsampling:](v5, "setEnforcesSignatureDownsampling:", -[DRSDampeningEnforcementSettings enforcesSignatureDownsampling](self, "enforcesSignatureDownsampling"));
  -[DRSDampeningEnforcementSettingsMO setEnforcesTotalCap:](v5, "setEnforcesTotalCap:", -[DRSDampeningEnforcementSettings enforcesTotalCap](self, "enforcesTotalCap"));
  return v5;
}

- (BOOL)enforcesResourceHysteresis
{
  return self->_enforcesResourceHysteresis;
}

- (void)setEnforcesResourceHysteresis:(BOOL)a3
{
  self->_enforcesResourceHysteresis = a3;
}

- (BOOL)enforcesResourceCap
{
  return self->_enforcesResourceCap;
}

- (void)setEnforcesResourceCap:(BOOL)a3
{
  self->_enforcesResourceCap = a3;
}

- (BOOL)enforcesResourceDownsampling
{
  return self->_enforcesResourceDownsampling;
}

- (void)setEnforcesResourceDownsampling:(BOOL)a3
{
  self->_enforcesResourceDownsampling = a3;
}

- (BOOL)enforcesSignatureHysteresis
{
  return self->_enforcesSignatureHysteresis;
}

- (void)setEnforcesSignatureHysteresis:(BOOL)a3
{
  self->_enforcesSignatureHysteresis = a3;
}

- (BOOL)enforcesSignatureCap
{
  return self->_enforcesSignatureCap;
}

- (void)setEnforcesSignatureCap:(BOOL)a3
{
  self->_enforcesSignatureCap = a3;
}

- (BOOL)enforcesSignatureDownsampling
{
  return self->_enforcesSignatureDownsampling;
}

- (void)setEnforcesSignatureDownsampling:(BOOL)a3
{
  self->_enforcesSignatureDownsampling = a3;
}

- (BOOL)enforcesTotalCap
{
  return self->_enforcesTotalCap;
}

- (void)setEnforcesTotalCap:(BOOL)a3
{
  self->_enforcesTotalCap = a3;
}

@end

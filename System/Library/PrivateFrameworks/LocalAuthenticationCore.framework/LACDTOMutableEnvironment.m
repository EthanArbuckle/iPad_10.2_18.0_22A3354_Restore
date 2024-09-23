@implementation LACDTOMutableEnvironment

- (BOOL)allowsAuthenticationFallbacks
{
  return -[LACDTOMutableEnvironment inFamiliarLocation](self, "inFamiliarLocation")
      || !-[LACDTOMutableEnvironment isDTOActive](self, "isDTOActive")
      || -[LACDTOMutableEnvironment hasExpiredBiometry](self, "hasExpiredBiometry");
}

- (BOOL)allowsGracePeriodUI
{
  _BOOL4 v3;

  v3 = -[LACDTOMutableEnvironment isDTOActive](self, "isDTOActive");
  if (v3)
  {
    v3 = -[LACDTOMutableEnvironment isGracePeriodActive](self, "isGracePeriodActive");
    if (v3)
      LOBYTE(v3) = !-[LACDTOMutableEnvironment hasExpiredBiometry](self, "hasExpiredBiometry");
  }
  return v3;
}

- (BOOL)isGracePeriodActive
{
  void *v2;
  char v3;

  -[LACDTOMutableEnvironment gracePeriodState](self, "gracePeriodState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (BOOL)hasExpiredBiometry
{
  void *v2;
  BOOL v3;

  -[LACDTOMutableEnvironment ratchetState](self, "ratchetState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rawValue") == 4;

  return v3;
}

- (BOOL)isDTOEnabled
{
  void *v2;
  char v3;

  -[LACDTOMutableEnvironment featureState](self, "featureState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)isDTOActive
{
  void *v3;
  void *v4;
  char v5;

  -[LACDTOMutableEnvironment featureState](self, "featureState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEnabled"))
  {
    -[LACDTOMutableEnvironment featureState](self, "featureState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAvailable");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isStrictModeEnabled
{
  void *v2;
  char v3;

  -[LACDTOMutableEnvironment featureState](self, "featureState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStrictModeEnabled");

  return v3;
}

- (BOOL)inFamiliarLocation
{
  void *v2;
  char v3;

  -[LACDTOMutableEnvironment locationState](self, "locationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInFamiliarLocation");

  return v3;
}

+ (id)nullInstance
{
  LACDTOMutableEnvironment *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init(LACDTOMutableEnvironment);
  -[LACDTOMutableEnvironment setConfirmed:](v2, "setConfirmed:", 0);
  +[LACDTOBiometryWatchdogPack nullInstance](LACDTOBiometryWatchdogPack, "nullInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableEnvironment setBiometryWatchdogPack:](v2, "setBiometryWatchdogPack:", v3);

  +[LACDTOMutableFeatureState nullInstance](LACDTOMutableFeatureState, "nullInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableEnvironment setFeatureState:](v2, "setFeatureState:", v4);

  +[LACDTOLocationState nullInstance](LACDTOLocationState, "nullInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableEnvironment setLocationState:](v2, "setLocationState:", v5);

  +[LACDTOLostModeState nullInstance](LACDTOLostModeState, "nullInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableEnvironment setLostModeState:](v2, "setLostModeState:", v6);

  +[LACDTORatchetState nullInstance](LACDTORatchetState, "nullInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableEnvironment setRatchetState:](v2, "setRatchetState:", v7);

  +[LACDTOGracePeriodState nullInstance](LACDTOGracePeriodState, "nullInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableEnvironment setGracePeriodState:](v2, "setGracePeriodState:", v8);

  return v2;
}

- (NSString)description
{
  int v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[16];

  v52[14] = *MEMORY[0x24BDAC8D0];
  v3 = os_variant_allows_internal_security_policies();
  v47 = (void *)MEMORY[0x24BDD17C8];
  v46 = objc_opt_class();
  v4 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableEnvironment isConfirmed](self, "isConfirmed"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("confirmed: %@"), v5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v51;
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableEnvironment isDTOEnabled](self, "isDTOEnabled"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("isDTOEnabled: %@"), v7);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v50;
  v8 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableEnvironment isDTOActive](self, "isDTOActive"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("isDTOActive: %@"), v9);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v49;
  v10 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableEnvironment isGracePeriodActive](self, "isGracePeriodActive"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("isGracePeriodActive: %@"), v11);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v48;
  v12 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableEnvironment isStrictModeEnabled](self, "isStrictModeEnabled"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("isStrictModeEnabled: %@"), v13);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v45;
  v14 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableEnvironment hasExpiredBiometry](self, "hasExpiredBiometry"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v14, "stringWithFormat:", CFSTR("hasExpiredBiometry: %@"), v15);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v44;
  v16 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    if (-[LACDTOMutableEnvironment allowsAuthenticationFallbacks](self, "allowsAuthenticationFallbacks"))
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
  }
  else
  {
    v17 = CFSTR("<private>");
  }
  objc_msgSend(v16, "stringWithFormat:", CFSTR("allowsAuthenticationFallbacks: %@"), v17);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v43;
  v18 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    if (-[LACDTOMutableEnvironment allowsGracePeriodUI](self, "allowsGracePeriodUI"))
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
  }
  else
  {
    v19 = CFSTR("<private>");
  }
  objc_msgSend(v18, "stringWithFormat:", CFSTR("allowsGracePeriodUI: %@"), v19);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v42;
  v20 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableEnvironment biometryWatchdogPack](self, "biometryWatchdogPack");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("biometryWatchdogPack: %@"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v40;
  v21 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableEnvironment locationState](self, "locationState");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("locationState: %@"), v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v38;
  v22 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableEnvironment lostModeState](self, "lostModeState");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("lostModeState: %@"), v37);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v23;
  v24 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableEnvironment featureState](self, "featureState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("featureState: %@"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v26;
  v27 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableEnvironment ratchetState](self, "ratchetState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("ratchetState: %@"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[12] = v29;
  v30 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableEnvironment gracePeriodState](self, "gracePeriodState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("gracePeriodState: %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[13] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 14);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "componentsJoinedByString:", CFSTR("; "));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v46, self, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v35;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_257087388))
  {
    v5 = v4;
    v6 = -[LACDTOMutableEnvironment isConfirmed](self, "isConfirmed");
    if (v6 != objc_msgSend(v5, "isConfirmed"))
      goto LABEL_29;
    v7 = -[LACDTOMutableEnvironment inFamiliarLocation](self, "inFamiliarLocation");
    if (v7 != objc_msgSend(v5, "inFamiliarLocation"))
      goto LABEL_29;
    v8 = -[LACDTOMutableEnvironment isDTOEnabled](self, "isDTOEnabled");
    if (v8 != objc_msgSend(v5, "isDTOEnabled"))
      goto LABEL_29;
    v9 = -[LACDTOMutableEnvironment hasExpiredBiometry](self, "hasExpiredBiometry");
    if (v9 != objc_msgSend(v5, "hasExpiredBiometry"))
      goto LABEL_29;
    v10 = -[LACDTOMutableEnvironment allowsAuthenticationFallbacks](self, "allowsAuthenticationFallbacks");
    if (v10 != objc_msgSend(v5, "allowsAuthenticationFallbacks"))
      goto LABEL_29;
    v11 = -[LACDTOMutableEnvironment allowsGracePeriodUI](self, "allowsGracePeriodUI");
    if (v11 != objc_msgSend(v5, "allowsGracePeriodUI"))
      goto LABEL_29;
    v12 = -[LACDTOMutableEnvironment isGracePeriodActive](self, "isGracePeriodActive");
    if (v12 != objc_msgSend(v5, "isGracePeriodActive"))
      goto LABEL_29;
    v13 = -[LACDTOMutableEnvironment isStrictModeEnabled](self, "isStrictModeEnabled");
    if (v13 != objc_msgSend(v5, "isStrictModeEnabled"))
      goto LABEL_29;
    -[LACDTOMutableEnvironment biometryWatchdogPack](self, "biometryWatchdogPack");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "biometryWatchdogPack");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[LACDTOMutableEnvironment biometryWatchdogPack](self, "biometryWatchdogPack");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "biometryWatchdogPack");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_29;
    }
    -[LACDTOMutableEnvironment featureState](self, "featureState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureState");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[LACDTOMutableEnvironment featureState](self, "featureState");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "featureState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_29;
    }
    -[LACDTOMutableEnvironment locationState](self, "locationState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationState");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[LACDTOMutableEnvironment locationState](self, "locationState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locationState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if ((v32 & 1) != 0)
        goto LABEL_29;
    }
    -[LACDTOMutableEnvironment lostModeState](self, "lostModeState");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lostModeState");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v33 == (void *)v34)
    {

    }
    else
    {
      v35 = (void *)v34;
      -[LACDTOMutableEnvironment lostModeState](self, "lostModeState");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lostModeState");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_29;
    }
    -[LACDTOMutableEnvironment ratchetState](self, "ratchetState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ratchetState");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v39 == (void *)v40)
    {

    }
    else
    {
      v41 = (void *)v40;
      -[LACDTOMutableEnvironment ratchetState](self, "ratchetState");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ratchetState");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
      {
LABEL_29:
        v20 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    -[LACDTOMutableEnvironment gracePeriodState](self, "gracePeriodState");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gracePeriodState");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v46 == (void *)v47)
    {
      v20 = 1;
      v48 = v46;
    }
    else
    {
      v48 = (void *)v47;
      -[LACDTOMutableEnvironment gracePeriodState](self, "gracePeriodState");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gracePeriodState");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v49, "isEqual:", v50);

    }
    goto LABEL_30;
  }
  v20 = 0;
LABEL_31:

  return v20;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (LACDTOBiometryWatchdogPack)biometryWatchdogPack
{
  return self->_biometryWatchdogPack;
}

- (void)setBiometryWatchdogPack:(id)a3
{
  objc_storeStrong((id *)&self->_biometryWatchdogPack, a3);
}

- (LACDTOFeatureState)featureState
{
  return self->_featureState;
}

- (void)setFeatureState:(id)a3
{
  objc_storeStrong((id *)&self->_featureState, a3);
}

- (LACDTOLocationState)locationState
{
  return self->_locationState;
}

- (void)setLocationState:(id)a3
{
  objc_storeStrong((id *)&self->_locationState, a3);
}

- (LACDTOLostModeState)lostModeState
{
  return self->_lostModeState;
}

- (void)setLostModeState:(id)a3
{
  objc_storeStrong((id *)&self->_lostModeState, a3);
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void)setRatchetState:(id)a3
{
  objc_storeStrong((id *)&self->_ratchetState, a3);
}

- (LACDTOGracePeriodState)gracePeriodState
{
  return self->_gracePeriodState;
}

- (void)setGracePeriodState:(id)a3
{
  objc_storeStrong((id *)&self->_gracePeriodState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gracePeriodState, 0);
  objc_storeStrong((id *)&self->_ratchetState, 0);
  objc_storeStrong((id *)&self->_lostModeState, 0);
  objc_storeStrong((id *)&self->_locationState, 0);
  objc_storeStrong((id *)&self->_featureState, 0);
  objc_storeStrong((id *)&self->_biometryWatchdogPack, 0);
}

@end

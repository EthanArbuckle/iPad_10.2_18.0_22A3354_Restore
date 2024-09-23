@implementation AXSwitchRecipeMapping

+ (id)recipeMappingWithDictionaryRepresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAction:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LongPressAction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLongPressAction:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Gesture"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGesture:", v9);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LongPressGesture"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLongPressGesture:", v11);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HoldPointX"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HoldPointY"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12 | v13)
  {
    if (v12 && v13)
    {
      objc_msgSend((id)v12, "doubleValue");
      v16 = v15;
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v5, "setHoldPoint:", v16, v17);
    }
    else
    {
      v31 = v12;
      v32 = v13;
      _AXAssert();
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Optional"), v31, v32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOptional:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SwitchUUID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SwitchUUID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);

    objc_msgSend(v5, "setSwitchUUID:", v22);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SwitchOriginalAction"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    _AXAssert();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SwitchOriginalAction"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SwitchOriginalAction"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSwitchOriginalAction:", objc_msgSend(v25, "integerValue"));

  }
  else
  {
    objc_msgSend(v5, "setSwitchOriginalAction:", 103);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ButtonPress"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGameControlButtonPress:", v27);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LongPressButtonPress"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLongPressGameControlButtonPress:", v29);

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  os_log_type_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitchRecipeMapping action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    _AXAssert();
  -[AXSwitchRecipeMapping action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXSwitchRecipeMapping action](self, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Action"));

  }
  -[AXSwitchRecipeMapping longPressAction](self, "longPressAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXSwitchRecipeMapping longPressAction](self, "longPressAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("LongPressAction"));

  }
  -[AXSwitchRecipeMapping gesture](self, "gesture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[AXSwitchRecipeMapping action](self, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Gesture"));

    if (v11)
      _AXAssert();
  }
  -[AXSwitchRecipeMapping holdPoint](self, "holdPoint");
  if (v13 == -1.0 && v12 == -1.0)
  {
    -[AXSwitchRecipeMapping action](self, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("HoldAtPoint"));

    if (v15)
      _AXAssert();
  }
  -[AXSwitchRecipeMapping gesture](self, "gesture");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB36F8];
    -[AXSwitchRecipeMapping gesture](self, "gesture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v55);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v55;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("Gesture"));

  }
  -[AXSwitchRecipeMapping longPressGesture](self, "longPressGesture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB36F8];
    -[AXSwitchRecipeMapping longPressGesture](self, "longPressGesture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v16;
    objc_msgSend(v21, "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, &v54);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v54;

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("LongPressGesture"));
    v16 = v24;
  }
  -[AXSwitchRecipeMapping gameControlButtonPress](self, "gameControlButtonPress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v53 = v16;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v25, 1, &v53);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v53;

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("ButtonPress"));
    v16 = v27;
  }
  -[AXSwitchRecipeMapping longPressGameControlButtonPress](self, "longPressGameControlButtonPress");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v52 = v16;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v28, 1, &v52);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v52;

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("LongPressButtonPress"));
    v16 = v30;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CF39F8], "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "ignoreLogging");

    if ((v32 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CF39F8], "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v34 = objc_claimAutoreleasedReturnValue();

      v35 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v34, v35))
      {
        AXColorizeFormatLog();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v16;
        _AXStringForArgs();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, v35))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v37;
          _os_log_impl(&dword_18C62B000, v34, v35, "%{public}@", buf, 0xCu);
        }

      }
    }
  }
  -[AXSwitchRecipeMapping holdPoint](self, "holdPoint", v51);
  if (v39 != -1.0 || v38 != -1.0)
  {
    v40 = (void *)MEMORY[0x1E0CB37E8];
    -[AXSwitchRecipeMapping holdPoint](self, "holdPoint");
    objc_msgSend(v40, "numberWithDouble:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("HoldPointX"));

    v42 = (void *)MEMORY[0x1E0CB37E8];
    -[AXSwitchRecipeMapping holdPoint](self, "holdPoint");
    objc_msgSend(v42, "numberWithDouble:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("HoldPointY"));

  }
  -[AXSwitchRecipeMapping switchUUID](self, "switchUUID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[AXSwitchRecipeMapping switchUUID](self, "switchUUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "UUIDString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("SwitchUUID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSwitchRecipeMapping isOptional](self, "isOptional"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("Optional"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXSwitchRecipeMapping switchOriginalAction](self, "switchOriginalAction"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("SwitchOriginalAction"));

  return v3;
}

- (AXSwitchRecipeMapping)init
{
  AXSwitchRecipeMapping *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSwitchRecipeMapping;
  result = -[AXSwitchRecipeMapping init](&v3, sel_init);
  if (result)
    result->_holdPoint = (CGPoint)AXSwitchRecipeHoldPointNone;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXSwitchRecipeMapping;
  -[AXSwitchRecipeMapping description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitchRecipeMapping action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitchRecipeMapping gesture](self, "gesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitchRecipeMapping switchUUID](self, "switchUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXSwitchRecipeMapping switchOriginalAction](self, "switchOriginalAction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\nAction: %@\nGesture: %@\nSwitch UUID: %@\nSwitch Original Action: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)longPressAction
{
  return self->_longPressAction;
}

- (void)setLongPressAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AXReplayableGesture)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
  objc_storeStrong((id *)&self->_gesture, a3);
}

- (AXReplayableGesture)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGesture, a3);
}

- (CGPoint)holdPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_holdPoint.x;
  y = self->_holdPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setHoldPoint:(CGPoint)a3
{
  self->_holdPoint = a3;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (AXSwitchGameControlButtonPress)gameControlButtonPress
{
  return self->_gameControlButtonPress;
}

- (void)setGameControlButtonPress:(id)a3
{
  objc_storeStrong((id *)&self->_gameControlButtonPress, a3);
}

- (AXSwitchGameControlButtonPress)longPressGameControlButtonPress
{
  return self->_longPressGameControlButtonPress;
}

- (void)setLongPressGameControlButtonPress:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGameControlButtonPress, a3);
}

- (NSUUID)switchUUID
{
  return self->_switchUUID;
}

- (void)setSwitchUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)switchOriginalAction
{
  return self->_switchOriginalAction;
}

- (void)setSwitchOriginalAction:(int64_t)a3
{
  self->_switchOriginalAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchUUID, 0);
  objc_storeStrong((id *)&self->_longPressGameControlButtonPress, 0);
  objc_storeStrong((id *)&self->_gameControlButtonPress, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_gesture, 0);
  objc_storeStrong((id *)&self->_longPressAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end

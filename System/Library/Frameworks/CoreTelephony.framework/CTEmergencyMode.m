@implementation CTEmergencyMode

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6 isStewieActive:(BOOL)a7 state:(int64_t)a8
{
  CTEmergencyMode *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTEmergencyMode;
  result = -[CTEmergencyMode init](&v15, sel_init);
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    result->_isEmergencySetup = a6;
    result->_isStewieActive = a7;
    result->_type = a4;
    result->_state = a8;
  }
  return result;
}

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6 state:(int64_t)a7
{
  CTEmergencyMode *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTEmergencyMode;
  result = -[CTEmergencyMode init](&v13, sel_init);
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    result->_isEmergencySetup = a6;
    result->_isStewieActive = 0;
    result->_type = a4;
    result->_state = a7;
  }
  return result;
}

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6 isStewieActive:(BOOL)a7
{
  CTEmergencyMode *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTEmergencyMode;
  result = -[CTEmergencyMode init](&v13, sel_init);
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    result->_isEmergencySetup = a6;
    result->_isStewieActive = a7;
    result->_type = a4;
    result->_state = 5;
  }
  return result;
}

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6
{
  CTEmergencyMode *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CTEmergencyMode;
  result = -[CTEmergencyMode init](&v11, sel_init);
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    result->_isEmergencySetup = a6;
    result->_isStewieActive = 0;
    result->_type = a4;
    result->_state = 5;
  }
  return result;
}

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5
{
  CTEmergencyMode *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTEmergencyMode;
  result = -[CTEmergencyMode init](&v9, sel_init);
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    *(_WORD *)&result->_isEmergencySetup = 1;
    result->_type = a4;
    result->_state = 5;
  }
  return result;
}

- (CTEmergencyMode)init
{
  return -[CTEmergencyMode initWithEnabled:type:isEmergencyText:isEmergencySetup:isStewieActive:state:](self, "initWithEnabled:type:isEmergencyText:isEmergencySetup:isStewieActive:state:", 0, 0, 0, 1, 0, 5);
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  int64_t v9;
  const char *v10;
  int64_t v11;
  const char *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTEmergencyMode enabled](self, "enabled");
  v5 = "disabled";
  if (v4)
    v5 = "enabled";
  objc_msgSend(v3, "appendFormat:", CFSTR(" %s"), v5);
  if (-[CTEmergencyMode isEmergencyText](self, "isEmergencyText"))
    v6 = "true";
  else
    v6 = "false";
  objc_msgSend(v3, "appendFormat:", CFSTR(" isEmergencyText=%s"), v6);
  if (-[CTEmergencyMode isEmergencySetup](self, "isEmergencySetup"))
    v7 = "true";
  else
    v7 = "false";
  objc_msgSend(v3, "appendFormat:", CFSTR(" isEmergencySetup=%s"), v7);
  if (_os_feature_enabled_impl())
  {
    if (-[CTEmergencyMode isStewieActive](self, "isStewieActive"))
      v8 = "true";
    else
      v8 = "false";
    objc_msgSend(v3, "appendFormat:", CFSTR(" isStewieActive=%s"), v8);
  }
  v9 = -[CTEmergencyMode type](self, "type");
  if ((unint64_t)(v9 - 1) > 4)
    v10 = "CTEmergencyModeUnknown";
  else
    v10 = off_1E15320F8[v9 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(" type=%s"), v10);
  v11 = -[CTEmergencyMode state](self, "state");
  if ((unint64_t)(v11 - 1) > 4)
    v12 = "CTEmergencyModeStateInCall";
  else
    v12 = off_1E1532120[v11 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(" state=%s"), v12);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTEmergencyMode:(id)a3
{
  id v4;
  int v5;
  int64_t v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  int64_t v12;

  v4 = a3;
  if (v4
    && (v5 = -[CTEmergencyMode enabled](self, "enabled"), v5 == objc_msgSend(v4, "enabled"))
    && (v6 = -[CTEmergencyMode type](self, "type"), v6 == objc_msgSend(v4, "type"))
    && (v7 = -[CTEmergencyMode isEmergencyText](self, "isEmergencyText"),
        v7 == objc_msgSend(v4, "isEmergencyText"))
    && (v8 = -[CTEmergencyMode isEmergencySetup](self, "isEmergencySetup"),
        v8 == objc_msgSend(v4, "isEmergencySetup"))
    && (v9 = -[CTEmergencyMode isStewieActive](self, "isStewieActive"),
        v9 == objc_msgSend(v4, "isStewieActive")))
  {
    v12 = -[CTEmergencyMode state](self, "state");
    v10 = v12 == objc_msgSend(v4, "state");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTEmergencyMode *v4;
  BOOL v5;

  v4 = (CTEmergencyMode *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTEmergencyMode isEqualToCTEmergencyMode:](self, "isEqualToCTEmergencyMode:", v4);
  }

  return v5;
}

+ (id)convertFromEmergencyMode:(const EmergencyMode *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int var2;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_alloc((Class)a1);
  v5 = (a3->var0 - 1);
  if (v5 < 5)
    v6 = v5 + 1;
  else
    v6 = 0;
  var2 = a3->var2;
  v8 = (var2 - 1);
  if (v8 < 5)
    v9 = v8 + 1;
  else
    v9 = 0;
  return (id)objc_msgSend(v4, "initWithEnabled:type:isEmergencyText:isEmergencySetup:isStewieActive:state:", var2 != 5, v6, var2 == 3, a3->var3 == 1, a3->var4, v9);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithEnabled:type:isEmergencyText:isEmergencySetup:isStewieActive:state:", -[CTEmergencyMode enabled](self, "enabled"), -[CTEmergencyMode type](self, "type"), -[CTEmergencyMode isEmergencyText](self, "isEmergencyText"), -[CTEmergencyMode isEmergencySetup](self, "isEmergencySetup"), -[CTEmergencyMode isStewieActive](self, "isStewieActive"), -[CTEmergencyMode state](self, "state"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isEmergencyText, CFSTR("isEmergencyText"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isEmergencySetup, CFSTR("isEmergencySetup"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isStewieActive, CFSTR("isStewieActiveKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_state, CFSTR("state"));

}

- (CTEmergencyMode)initWithCoder:(id)a3
{
  id v4;
  CTEmergencyMode *v5;

  v4 = a3;
  v5 = -[CTEmergencyMode initWithEnabled:type:isEmergencyText:isEmergencySetup:isStewieActive:state:](self, "initWithEnabled:type:isEmergencyText:isEmergencySetup:isStewieActive:state:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmergencyText")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmergencySetup")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStewieActiveKey")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state")));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isEmergencyText
{
  return self->_isEmergencyText;
}

- (void)setIsEmergencyText:(BOOL)a3
{
  self->_isEmergencyText = a3;
}

- (BOOL)isEmergencySetup
{
  return self->_isEmergencySetup;
}

- (void)setIsEmergencySetup:(BOOL)a3
{
  self->_isEmergencySetup = a3;
}

- (BOOL)isStewieActive
{
  return self->_isStewieActive;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end

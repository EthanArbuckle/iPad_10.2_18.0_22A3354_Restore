@implementation NEFilterControlVerdict

- (NEFilterControlVerdict)initWithCoder:(id)a3
{
  id v4;
  NEFilterControlVerdict *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NEFilterControlVerdict;
  v5 = -[NEFilterNewFlowVerdict initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_updateRules = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UpdateRules"));
    v5->_handledByDataProvider = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HandleByDataProvider"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 handledByDataProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEFilterControlVerdict;
  v4 = a3;
  -[NEFilterNewFlowVerdict encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (self)
  {
    objc_msgSend(v4, "encodeBool:forKey:", self->_updateRules, CFSTR("UpdateRules"), v6.receiver, v6.super_class);
    handledByDataProvider = self->_handledByDataProvider;
  }
  else
  {
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UpdateRules"), v6.receiver, v6.super_class);
    handledByDataProvider = 0;
  }
  objc_msgSend(v4, "encodeBool:forKey:", handledByDataProvider, CFSTR("HandleByDataProvider"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  BOOL updateRules;
  BOOL handledByDataProvider;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NEFilterControlVerdict;
  result = -[NEFilterNewFlowVerdict copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (self)
  {
    updateRules = self->_updateRules;
    if (!result)
      goto LABEL_4;
    goto LABEL_3;
  }
  updateRules = 0;
  if (result)
LABEL_3:
    *((_BYTE *)result + 72) = updateRules;
LABEL_4:
  if (self)
  {
    handledByDataProvider = self->_handledByDataProvider;
    if (!result)
      return result;
  }
  else
  {
    handledByDataProvider = 0;
    if (!result)
      return result;
  }
  *((_BYTE *)result + 73) = handledByDataProvider;
  return result;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  _BOOL8 handledByDataProvider;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterControlVerdict;
  -[NEFilterNewFlowVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self)
  {
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", self->_updateRules, CFSTR("updateRules"), v5, a4);
    handledByDataProvider = self->_handledByDataProvider;
  }
  else
  {
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", 0, CFSTR("updateRules"), v5, a4);
    handledByDataProvider = 0;
  }
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", handledByDataProvider, CFSTR("handledByDataProvider"), v5, a4);
  return v8;
}

- (NEFilterControlVerdict)init
{
  NEFilterControlVerdict *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEFilterControlVerdict;
  result = -[NEFilterControlVerdict init](&v3, sel_init);
  if (result)
  {
    result->_updateRules = 0;
    result->_handledByDataProvider = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEFilterControlVerdict)allowVerdictWithUpdateRules:(BOOL)updateRules
{
  NEFilterControlVerdict *v4;

  v4 = -[NEFilterVerdict initWithDrop:remediate:]([NEFilterControlVerdict alloc], "initWithDrop:remediate:", 0, 0);
  -[NEFilterNewFlowVerdict setFilterInbound:](v4, "setFilterInbound:", 0);
  -[NEFilterNewFlowVerdict setFilterOutbound:](v4, "setFilterOutbound:", 0);
  if (v4)
  {
    v4->_updateRules = updateRules;
    v4->_handledByDataProvider = 0;
  }
  return v4;
}

+ (NEFilterControlVerdict)dropVerdictWithUpdateRules:(BOOL)updateRules
{
  NEFilterControlVerdict *v4;

  v4 = -[NEFilterVerdict initWithDrop:remediate:]([NEFilterControlVerdict alloc], "initWithDrop:remediate:", 1, 0);
  if (v4)
  {
    v4->_updateRules = updateRules;
    v4->_handledByDataProvider = 0;
  }
  return v4;
}

+ (NEFilterControlVerdict)updateRules
{
  NEFilterControlVerdict *v2;

  v2 = objc_alloc_init(NEFilterControlVerdict);
  if (v2)
    v2->_updateRules = 1;
  return v2;
}

@end

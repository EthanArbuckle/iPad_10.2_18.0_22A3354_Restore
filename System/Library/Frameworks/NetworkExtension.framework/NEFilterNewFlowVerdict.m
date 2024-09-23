@implementation NEFilterNewFlowVerdict

- (NEFilterNewFlowVerdict)initWithCoder:(id)a3
{
  id v4;
  NEFilterNewFlowVerdict *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NEFilterNewFlowVerdict;
  v5 = -[NEFilterVerdict initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_filterInbound = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FilterInbound"));
    v5->_filterOutbound = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FilterOutbound"));
    v5->_peekInboundBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("PeekInboundBytes"));
    v5->_peekOutboundBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("PeekOutboundBytes"));
    v5->_statisticsReportFrequency = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("StatisticsReportFrequency"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEFilterNewFlowVerdict;
  v4 = a3;
  -[NEFilterVerdict encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[NEFilterNewFlowVerdict filterInbound](self, "filterInbound", v5.receiver, v5.super_class), CFSTR("FilterInbound"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"), CFSTR("FilterOutbound"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterNewFlowVerdict peekInboundBytes](self, "peekInboundBytes"), CFSTR("PeekInboundBytes"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterNewFlowVerdict peekOutboundBytes](self, "peekOutboundBytes"), CFSTR("PeekOutboundBytes"));
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterNewFlowVerdict statisticsReportFrequency](self, "statisticsReportFrequency"), CFSTR("StatisticsReportFrequency"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEFilterNewFlowVerdict;
  v4 = -[NEFilterVerdict copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setFilterInbound:", -[NEFilterNewFlowVerdict filterInbound](self, "filterInbound"));
  objc_msgSend(v4, "setFilterOutbound:", -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"));
  objc_msgSend(v4, "setPeekInboundBytes:", -[NEFilterNewFlowVerdict peekInboundBytes](self, "peekInboundBytes"));
  objc_msgSend(v4, "setPeekOutboundBytes:", -[NEFilterNewFlowVerdict peekOutboundBytes](self, "peekOutboundBytes"));
  objc_msgSend(v4, "setStatisticsReportFrequency:", -[NEFilterNewFlowVerdict statisticsReportFrequency](self, "statisticsReportFrequency"));
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  NEFilterReportFrequency v8;
  const __CFString *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterNewFlowVerdict;
  -[NEFilterVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterNewFlowVerdict filterInbound](self, "filterInbound"), CFSTR("filterInbound"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterNewFlowVerdict peekInboundBytes](self, "peekInboundBytes"), CFSTR("peekInboundBytes"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"), CFSTR("filterOutbound"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterNewFlowVerdict peekOutboundBytes](self, "peekOutboundBytes"), CFSTR("peekOutboundBytes"), v5, a4);
  v8 = -[NEFilterNewFlowVerdict statisticsReportFrequency](self, "statisticsReportFrequency");
  objc_opt_self();
  if ((unint64_t)(v8 - 1) > 2)
    v9 = CFSTR("none");
  else
    v9 = off_1E3CC0610[v8 - 1];
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("statisticsReportFrequency"), v5, a4);
  return v7;
}

- (int64_t)filterAction
{
  int64_t result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NEFilterNewFlowVerdict;
  result = -[NEFilterVerdict filterAction](&v4, sel_filterAction);
  if (!result)
  {
    if (-[NEFilterNewFlowVerdict filterInbound](self, "filterInbound")
      || -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"))
    {
      return 4;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (NEFilterReportFrequency)statisticsReportFrequency
{
  return self->_statisticsReportFrequency;
}

- (void)setStatisticsReportFrequency:(NEFilterReportFrequency)statisticsReportFrequency
{
  self->_statisticsReportFrequency = statisticsReportFrequency;
}

- (BOOL)filterInbound
{
  return self->_filterInbound;
}

- (void)setFilterInbound:(BOOL)a3
{
  self->_filterInbound = a3;
}

- (BOOL)filterOutbound
{
  return self->_filterOutbound;
}

- (void)setFilterOutbound:(BOOL)a3
{
  self->_filterOutbound = a3;
}

- (unint64_t)peekInboundBytes
{
  return self->_peekInboundBytes;
}

- (void)setPeekInboundBytes:(unint64_t)a3
{
  self->_peekInboundBytes = a3;
}

- (unint64_t)peekOutboundBytes
{
  return self->_peekOutboundBytes;
}

- (void)setPeekOutboundBytes:(unint64_t)a3
{
  self->_peekOutboundBytes = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEFilterNewFlowVerdict)needRulesVerdict
{
  void *v2;

  +[NEFilterNewFlowVerdict allowVerdict](NEFilterNewFlowVerdict, "allowVerdict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedRules:", 1);
  return (NEFilterNewFlowVerdict *)v2;
}

+ (NEFilterNewFlowVerdict)allowVerdict
{
  NEFilterNewFlowVerdict *v2;

  v2 = -[NEFilterVerdict initWithDrop:remediate:]([NEFilterNewFlowVerdict alloc], "initWithDrop:remediate:", 0, 0);
  -[NEFilterNewFlowVerdict setFilterInbound:](v2, "setFilterInbound:", 0);
  -[NEFilterNewFlowVerdict setFilterOutbound:](v2, "setFilterOutbound:", 0);
  return v2;
}

+ (NEFilterNewFlowVerdict)dropVerdict
{
  return -[NEFilterVerdict initWithDrop:remediate:]([NEFilterNewFlowVerdict alloc], "initWithDrop:remediate:", 1, 0);
}

+ (NEFilterNewFlowVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey
{
  NSString *v5;
  NSString *v6;
  NEFilterNewFlowVerdict *v7;
  const char *v8;
  NEFilterNewFlowVerdict *v9;
  SEL v10;

  v5 = remediationURLMapKey;
  v6 = remediationButtonTextMapKey;
  v7 = -[NEFilterVerdict initWithDrop:remediate:]([NEFilterNewFlowVerdict alloc], "initWithDrop:remediate:", 1, 1);
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v5, 16);
    objc_setProperty_atomic(v9, v10, v6, 24);
  }

  return v9;
}

+ (NEFilterNewFlowVerdict)URLAppendStringVerdictWithMapKey:(NSString *)urlAppendMapKey
{
  NSString *v3;
  _BYTE *v4;
  const char *v5;
  void *v6;

  v3 = urlAppendMapKey;
  +[NEFilterNewFlowVerdict allowVerdict](NEFilterNewFlowVerdict, "allowVerdict");
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    v4[12] = 1;
    objc_setProperty_atomic(v4, v5, v3, 32);
  }

  return (NEFilterNewFlowVerdict *)v6;
}

+ (NEFilterNewFlowVerdict)filterDataVerdictWithFilterInbound:(BOOL)filterInbound peekInboundBytes:(NSUInteger)peekInboundBytes filterOutbound:(BOOL)filterOutbound peekOutboundBytes:(NSUInteger)peekOutboundBytes
{
  _BOOL8 v7;
  _BOOL8 v9;
  NEFilterNewFlowVerdict *v10;

  v7 = filterOutbound;
  v9 = filterInbound;
  v10 = -[NEFilterVerdict initWithDrop:remediate:]([NEFilterNewFlowVerdict alloc], "initWithDrop:remediate:", 0, 0);
  -[NEFilterNewFlowVerdict setFilterInbound:](v10, "setFilterInbound:", v9);
  -[NEFilterNewFlowVerdict setPeekInboundBytes:](v10, "setPeekInboundBytes:", peekInboundBytes);
  -[NEFilterNewFlowVerdict setFilterOutbound:](v10, "setFilterOutbound:", v7);
  -[NEFilterNewFlowVerdict setPeekOutboundBytes:](v10, "setPeekOutboundBytes:", peekOutboundBytes);
  return v10;
}

+ (NEFilterNewFlowVerdict)pauseVerdict
{
  NEFilterNewFlowVerdict *v2;
  objc_super v4;

  v2 = [NEFilterNewFlowVerdict alloc];
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)NEFilterVerdict;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2)
      v2->super._pause = 1;
  }
  return v2;
}

@end

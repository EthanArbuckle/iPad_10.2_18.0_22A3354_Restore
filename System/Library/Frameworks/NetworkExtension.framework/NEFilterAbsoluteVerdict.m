@implementation NEFilterAbsoluteVerdict

- (NEFilterAbsoluteVerdict)initWithCoder:(id)a3
{
  id v4;
  NEFilterAbsoluteVerdict *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NEFilterAbsoluteVerdict;
  v5 = -[NEFilterVerdict initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_inboundPassOffset = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Inbound pass offset"));
    v5->_inboundPeekOffset = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Inbound peek offset"));
    v5->_outboundPassOffset = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Outbound pass offset"));
    v5->_outboundPeekOffset = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Outbound peek offset"));
    v5->_statisticsReportFrequency = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("StatisticsReportFrequency"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEFilterAbsoluteVerdict;
  v4 = a3;
  -[NEFilterVerdict encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterAbsoluteVerdict inboundPassOffset](self, "inboundPassOffset", v5.receiver, v5.super_class), CFSTR("Inbound pass offset"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterAbsoluteVerdict inboundPeekOffset](self, "inboundPeekOffset"), CFSTR("Inbound peek offset"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterAbsoluteVerdict outboundPassOffset](self, "outboundPassOffset"), CFSTR("Outbound pass offset"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterAbsoluteVerdict outboundPeekOffset](self, "outboundPeekOffset"), CFSTR("Outbound peek offset"));
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterAbsoluteVerdict statisticsReportFrequency](self, "statisticsReportFrequency"), CFSTR("StatisticsReportFrequency"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEFilterAbsoluteVerdict;
  v4 = -[NEFilterVerdict copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setInboundPassOffset:", -[NEFilterAbsoluteVerdict inboundPassOffset](self, "inboundPassOffset"));
  objc_msgSend(v4, "setInboundPeekOffset:", -[NEFilterAbsoluteVerdict inboundPeekOffset](self, "inboundPeekOffset"));
  objc_msgSend(v4, "setOutboundPassOffset:", -[NEFilterAbsoluteVerdict outboundPassOffset](self, "outboundPassOffset"));
  objc_msgSend(v4, "setOutboundPeekOffset:", -[NEFilterAbsoluteVerdict outboundPeekOffset](self, "outboundPeekOffset"));
  objc_msgSend(v4, "setStatisticsReportFrequency:", -[NEFilterAbsoluteVerdict statisticsReportFrequency](self, "statisticsReportFrequency"));
  return v4;
}

- (NEFilterAbsoluteVerdict)initWithDrop:(BOOL)a3 inboundPassOffset:(unint64_t)a4 inboundPeekOffset:(unint64_t)a5 outboundPassOffset:(unint64_t)a6 outboundPeekOffset:(unint64_t)a7
{
  NEFilterAbsoluteVerdict *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NEFilterAbsoluteVerdict;
  result = -[NEFilterVerdict initWithDrop:remediate:](&v12, sel_initWithDrop_remediate_, a3, 0);
  if (result)
  {
    result->_inboundPassOffset = a4;
    result->_inboundPeekOffset = a5;
    result->_outboundPassOffset = a6;
    result->_outboundPeekOffset = a7;
  }
  return result;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  int64_t v8;
  const __CFString *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterAbsoluteVerdict;
  -[NEFilterVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterAbsoluteVerdict inboundPassOffset](self, "inboundPassOffset"), CFSTR("inboundPassOffset"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterAbsoluteVerdict inboundPeekOffset](self, "inboundPeekOffset"), CFSTR("inboundPeekOffset"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterAbsoluteVerdict outboundPassOffset](self, "outboundPassOffset"), CFSTR("outboundPassOffset"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterAbsoluteVerdict outboundPeekOffset](self, "outboundPeekOffset"), CFSTR("outboundPeekOffset"), v5, a4);
  v8 = -[NEFilterAbsoluteVerdict statisticsReportFrequency](self, "statisticsReportFrequency");
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
  v4.super_class = (Class)NEFilterAbsoluteVerdict;
  result = -[NEFilterVerdict filterAction](&v4, sel_filterAction);
  if (!result)
  {
    if (-[NEFilterAbsoluteVerdict inboundPassOffset](self, "inboundPassOffset") == -1
      && -[NEFilterAbsoluteVerdict outboundPassOffset](self, "outboundPassOffset") == -1)
    {
      return 1;
    }
    else
    {
      return 4;
    }
  }
  return result;
}

- (unint64_t)inboundPassOffset
{
  return self->_inboundPassOffset;
}

- (void)setInboundPassOffset:(unint64_t)a3
{
  self->_inboundPassOffset = a3;
}

- (unint64_t)inboundPeekOffset
{
  return self->_inboundPeekOffset;
}

- (void)setInboundPeekOffset:(unint64_t)a3
{
  self->_inboundPeekOffset = a3;
}

- (unint64_t)outboundPassOffset
{
  return self->_outboundPassOffset;
}

- (void)setOutboundPassOffset:(unint64_t)a3
{
  self->_outboundPassOffset = a3;
}

- (unint64_t)outboundPeekOffset
{
  return self->_outboundPeekOffset;
}

- (void)setOutboundPeekOffset:(unint64_t)a3
{
  self->_outboundPeekOffset = a3;
}

- (int64_t)statisticsReportFrequency
{
  return self->_statisticsReportFrequency;
}

- (void)setStatisticsReportFrequency:(int64_t)a3
{
  self->_statisticsReportFrequency = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

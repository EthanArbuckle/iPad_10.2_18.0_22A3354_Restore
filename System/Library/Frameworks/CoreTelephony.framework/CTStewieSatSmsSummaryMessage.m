@implementation CTStewieSatSmsSummaryMessage

- (CTStewieSatSmsSummaryMessage)initWithPendingSatSmsTotalCount:(int64_t)a3 error:(id *)a4
{
  CTStewieSatSmsSummaryMessage *v5;
  CTStewieSatSmsSummaryMessage *v6;
  CTStewieSatSmsSummaryMessage *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTStewieSatSmsSummaryMessage;
  v5 = -[CTStewieSatSmsSummaryMessage init](&v9, sel_init, a3, a4);
  v6 = v5;
  if (v5)
  {
    v5->_pendingSatSmsTotalCount = a3;
    v7 = v5;
  }

  return v6;
}

- (NSString)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", pendingSatSmsTotalCount=%ld"), -[CTStewieSatSmsSummaryMessage pendingSatSmsTotalCount](self, "pendingSatSmsTotalCount"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[CTStewieSatSmsSummaryMessage pendingSatSmsTotalCount](self, "pendingSatSmsTotalCount");
  LOBYTE(v5) = v5 == objc_msgSend(v4, "pendingSatSmsTotalCount");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieSatSmsSummaryMessage *v4;
  BOOL v5;

  v4 = (CTStewieSatSmsSummaryMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieSatSmsSummaryMessage isEqualToOther:](self, "isEqualToOther:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPendingSatSmsTotalCount:", -[CTStewieSatSmsSummaryMessage pendingSatSmsTotalCount](self, "pendingSatSmsTotalCount"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieSatSmsSummaryMessage pendingSatSmsTotalCount](self, "pendingSatSmsTotalCount"), CFSTR("pendingSatSmsTotalCount"));

}

- (CTStewieSatSmsSummaryMessage)initWithCoder:(id)a3
{
  id v4;
  CTStewieSatSmsSummaryMessage *v5;

  v4 = a3;
  v5 = -[CTStewieSatSmsSummaryMessage initWithPendingSatSmsTotalCount:error:](self, "initWithPendingSatSmsTotalCount:error:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pendingSatSmsTotalCount")), 0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)pendingSatSmsTotalCount
{
  return self->_pendingSatSmsTotalCount;
}

- (void)setPendingSatSmsTotalCount:(int64_t)a3
{
  self->_pendingSatSmsTotalCount = a3;
}

@end

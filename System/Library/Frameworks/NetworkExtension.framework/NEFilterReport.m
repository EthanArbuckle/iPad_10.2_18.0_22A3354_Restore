@implementation NEFilterReport

- (NEFilterReport)initWithCoder:(id)a3
{
  id v4;
  NEFilterReport *v5;
  uint64_t v6;
  NEFilterFlow *flow;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEFilterReport;
  v5 = -[NEFilterReport init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNEFilterReportFlow"));
    v6 = objc_claimAutoreleasedReturnValue();
    flow = v5->_flow;
    v5->_flow = (NEFilterFlow *)v6;

    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kNEFilterReportAction"));
    v5->_event = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reportEvent"));
    v5->_bytesInboundCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bytesInboundCount"));
    v5->_bytesOutboundCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bytesOutboundCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NEFilterReport flow](self, "flow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kNEFilterReportFlow"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[NEFilterReport action](self, "action"), CFSTR("kNEFilterReportAction"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[NEFilterReport event](self, "event"), CFSTR("reportEvent"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[NEFilterReport bytesInboundCount](self, "bytesInboundCount"), CFSTR("bytesInboundCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[NEFilterReport bytesOutboundCount](self, "bytesOutboundCount"), CFSTR("bytesOutboundCount"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NEFilterReport flow](self, "flow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlow:", v5);

  objc_msgSend(v4, "setAction:", -[NEFilterReport action](self, "action"));
  objc_msgSend(v4, "setBytesInboundCount:", -[NEFilterReport bytesInboundCount](self, "bytesInboundCount"));
  objc_msgSend(v4, "setBytesOutboundCount:", -[NEFilterReport bytesOutboundCount](self, "bytesOutboundCount"));
  return v4;
}

- (NEFilterReport)init
{
  return (NEFilterReport *)-[NEFilterReport initWithFlow:action:event:](self, 0, 0, 0);
}

- (NEFilterFlow)flow
{
  return (NEFilterFlow *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NEFilterAction)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NEFilterReportEvent)event
{
  return self->_event;
}

- (NSUInteger)bytesInboundCount
{
  return self->_bytesInboundCount;
}

- (void)setBytesInboundCount:(unint64_t)a3
{
  self->_bytesInboundCount = a3;
}

- (NSUInteger)bytesOutboundCount
{
  return self->_bytesOutboundCount;
}

- (void)setBytesOutboundCount:(unint64_t)a3
{
  self->_bytesOutboundCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
}

- (_QWORD)initWithFlow:(uint64_t)a3 action:(uint64_t)a4 event:
{
  id v7;
  _QWORD *v8;
  objc_super v10;

  v7 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)NEFilterReport;
    v8 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setFlow:", v7);
      objc_msgSend(a1, "setAction:", a3);
      a1[3] = a4;
      a1[4] = objc_msgSend(v7, "inBytes");
      a1[5] = objc_msgSend(v7, "outBytes");
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

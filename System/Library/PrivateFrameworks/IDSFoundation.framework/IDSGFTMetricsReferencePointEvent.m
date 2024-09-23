@implementation IDSGFTMetricsReferencePointEvent

- (IDSGFTMetricsReferencePointEvent)initWithTime:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  IDSGFTMetricsReferencePointEvent *v9;
  IDSGFTMetricsReferencePointEvent *v10;
  IDSGFTMetricsReferencePointEvent *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IDSGFTMetricsReferencePointEvent;
  v9 = -[IDSGFTMetricsReferencePointEvent init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_time, a3);
    objc_storeStrong((id *)&v10->_reason, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  double v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("time:%@ reason:%@"), v2, self->_time, self->_reason);
}

- (NSNumber)reason
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSNumber)time
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTime:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end

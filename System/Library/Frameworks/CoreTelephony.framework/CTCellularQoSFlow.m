@implementation CTCellularQoSFlow

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", flowId=%lu"), -[CTCellularQoSFlow flowId](self, "flowId"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", bearerId=%lu"), -[CTCellularQoSFlow bearerId](self, "bearerId"));
  -[CTCellularQoSFlow queueSetId](self, "queueSetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTCellularQoSFlow queueSetId](self, "queueSetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", queueSetId=%@"), v5);

  }
  -[CTCellularQoSFlow is5G](self, "is5G");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTCellularQoSFlow is5G](self, "is5G");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
      objc_msgSend(v3, "appendFormat:", CFSTR(", is5G=true"));
  }
  -[CTCellularQoSFlow txQos](self, "txQos");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CTCellularQoSFlow txQos](self, "txQos");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", txQos=%@"), v10);

  }
  -[CTCellularQoSFlow rxQos](self, "rxQos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CTCellularQoSFlow rxQos](self, "rxQos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", rxQos=%@"), v12);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFlowId:", -[CTCellularQoSFlow flowId](self, "flowId"));
  objc_msgSend(v4, "setBearerId:", -[CTCellularQoSFlow bearerId](self, "bearerId"));
  -[CTCellularQoSFlow queueSetId](self, "queueSetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CTCellularQoSFlow queueSetId](self, "queueSetId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setQueueSetId:", v7);

  }
  -[CTCellularQoSFlow is5G](self, "is5G");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTCellularQoSFlow is5G](self, "is5G");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setIs5G:", v10);

  }
  else
  {
    objc_msgSend(v4, "setQueueSetId:", 0);
  }
  -[CTCellularQoSFlow txQos](self, "txQos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setTxQos:", v12);

  -[CTCellularQoSFlow rxQos](self, "rxQos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setRxQos:", v14);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[CTCellularQoSFlow flowId](self, "flowId"), CFSTR("flowId"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[CTCellularQoSFlow bearerId](self, "bearerId"), CFSTR("bearerId"));
  -[CTCellularQoSFlow queueSetId](self, "queueSetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("queueSetId"));

  -[CTCellularQoSFlow is5G](self, "is5G");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("is5G"));

  -[CTCellularQoSFlow txQos](self, "txQos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("txQos"));

  -[CTCellularQoSFlow rxQos](self, "rxQos");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("rxQos"));

}

- (CTCellularQoSFlow)initWithCoder:(id)a3
{
  id v4;
  CTCellularQoSFlow *v5;
  uint64_t v6;
  NSNumber *queueSetId;
  uint64_t v8;
  NSNumber *is5G;
  uint64_t v10;
  CTQoS *txQos;
  uint64_t v12;
  CTQoS *rxQos;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTCellularQoSFlow;
  v5 = -[CTCellularQoSFlow init](&v15, sel_init);
  if (v5)
  {
    v5->_flowId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("flowId"));
    v5->_bearerId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bearerId"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queueSetId"));
    v6 = objc_claimAutoreleasedReturnValue();
    queueSetId = v5->_queueSetId;
    v5->_queueSetId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("is5G"));
    v8 = objc_claimAutoreleasedReturnValue();
    is5G = v5->_is5G;
    v5->_is5G = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("txQos"));
    v10 = objc_claimAutoreleasedReturnValue();
    txQos = v5->_txQos;
    v5->_txQos = (CTQoS *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rxQos"));
    v12 = objc_claimAutoreleasedReturnValue();
    rxQos = v5->_rxQos;
    v5->_rxQos = (CTQoS *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)flowId
{
  return self->_flowId;
}

- (void)setFlowId:(unint64_t)a3
{
  self->_flowId = a3;
}

- (unint64_t)bearerId
{
  return self->_bearerId;
}

- (void)setBearerId:(unint64_t)a3
{
  self->_bearerId = a3;
}

- (NSNumber)queueSetId
{
  return self->_queueSetId;
}

- (void)setQueueSetId:(id)a3
{
  objc_storeStrong((id *)&self->_queueSetId, a3);
}

- (NSNumber)is5G
{
  return self->_is5G;
}

- (void)setIs5G:(id)a3
{
  objc_storeStrong((id *)&self->_is5G, a3);
}

- (CTQoS)txQos
{
  return self->_txQos;
}

- (void)setTxQos:(id)a3
{
  objc_storeStrong((id *)&self->_txQos, a3);
}

- (CTQoS)rxQos
{
  return self->_rxQos;
}

- (void)setRxQos:(id)a3
{
  objc_storeStrong((id *)&self->_rxQos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxQos, 0);
  objc_storeStrong((id *)&self->_txQos, 0);
  objc_storeStrong((id *)&self->_is5G, 0);
  objc_storeStrong((id *)&self->_queueSetId, 0);
}

@end

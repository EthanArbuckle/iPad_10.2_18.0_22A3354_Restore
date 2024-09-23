@implementation CTSignalStrengthMeasurements

- (id)description
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSignalStrengthMeasurements rssi](self, "rssi");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTSignalStrengthMeasurements rssi](self, "rssi");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", rssi=%@"), v5);

  }
  -[CTSignalStrengthMeasurements rscp](self, "rscp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTSignalStrengthMeasurements rscp](self, "rscp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", rscp=%@"), v7);

  }
  -[CTSignalStrengthMeasurements ecn0](self, "ecn0");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTSignalStrengthMeasurements ecn0](self, "ecn0");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", ecn0=%@"), v9);

  }
  -[CTSignalStrengthMeasurements rsrp](self, "rsrp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CTSignalStrengthMeasurements rsrp](self, "rsrp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", rsrp=%@"), v11);

  }
  -[CTSignalStrengthMeasurements rsrq](self, "rsrq");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CTSignalStrengthMeasurements rsrq](self, "rsrq");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", rsrq=%@"), v13);

  }
  -[CTSignalStrengthMeasurements snr](self, "snr");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CTSignalStrengthMeasurements snr](self, "snr");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", snr=%@"), v15);

  }
  -[CTSignalStrengthMeasurements ecio](self, "ecio");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CTSignalStrengthMeasurements ecio](self, "ecio");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", ecio=%@"), v17);

  }
  -[CTSignalStrengthMeasurements rxagc](self, "rxagc");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CTSignalStrengthMeasurements rxagc](self, "rxagc");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", rxagc=%@"), v19);

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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSignalStrengthMeasurements rssi](self, "rssi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setRssi:", v6);

  -[CTSignalStrengthMeasurements rscp](self, "rscp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setRscp:", v8);

  -[CTSignalStrengthMeasurements ecn0](self, "ecn0");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setEcn0:", v10);

  -[CTSignalStrengthMeasurements rsrp](self, "rsrp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setRsrp:", v12);

  -[CTSignalStrengthMeasurements rsrq](self, "rsrq");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setRsrq:", v14);

  -[CTSignalStrengthMeasurements snr](self, "snr");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setSnr:", v16);

  -[CTSignalStrengthMeasurements ecio](self, "ecio");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setEcio:", v18);

  -[CTSignalStrengthMeasurements rxagc](self, "rxagc");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setRxagc:", v20);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CTSignalStrengthMeasurements rssi](self, "rssi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rssi"));

  -[CTSignalStrengthMeasurements rscp](self, "rscp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("rscp"));

  -[CTSignalStrengthMeasurements ecn0](self, "ecn0");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ecn0"));

  -[CTSignalStrengthMeasurements rsrp](self, "rsrp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("rsrp"));

  -[CTSignalStrengthMeasurements rsrq](self, "rsrq");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("rsrq"));

  -[CTSignalStrengthMeasurements snr](self, "snr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("snr"));

  -[CTSignalStrengthMeasurements ecio](self, "ecio");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("ecio"));

  -[CTSignalStrengthMeasurements rxagc](self, "rxagc");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("rxagc"));

}

- (CTSignalStrengthMeasurements)initWithCoder:(id)a3
{
  id v4;
  CTSignalStrengthMeasurements *v5;
  uint64_t v6;
  NSNumber *rssi;
  uint64_t v8;
  NSNumber *rscp;
  uint64_t v10;
  NSNumber *ecn0;
  uint64_t v12;
  NSNumber *rsrp;
  uint64_t v14;
  NSNumber *rsrq;
  uint64_t v16;
  NSNumber *snr;
  uint64_t v18;
  NSNumber *ecio;
  uint64_t v20;
  NSNumber *rxagc;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTSignalStrengthMeasurements;
  v5 = -[CTSignalStrengthMeasurements init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rssi"));
    v6 = objc_claimAutoreleasedReturnValue();
    rssi = v5->_rssi;
    v5->_rssi = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rscp"));
    v8 = objc_claimAutoreleasedReturnValue();
    rscp = v5->_rscp;
    v5->_rscp = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ecn0"));
    v10 = objc_claimAutoreleasedReturnValue();
    ecn0 = v5->_ecn0;
    v5->_ecn0 = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rsrp"));
    v12 = objc_claimAutoreleasedReturnValue();
    rsrp = v5->_rsrp;
    v5->_rsrp = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rsrq"));
    v14 = objc_claimAutoreleasedReturnValue();
    rsrq = v5->_rsrq;
    v5->_rsrq = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snr"));
    v16 = objc_claimAutoreleasedReturnValue();
    snr = v5->_snr;
    v5->_snr = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ecio"));
    v18 = objc_claimAutoreleasedReturnValue();
    ecio = v5->_ecio;
    v5->_ecio = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rxagc"));
    v20 = objc_claimAutoreleasedReturnValue();
    rxagc = v5->_rxagc;
    v5->_rxagc = (NSNumber *)v20;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
  objc_storeStrong((id *)&self->_rssi, a3);
}

- (NSNumber)rscp
{
  return self->_rscp;
}

- (void)setRscp:(id)a3
{
  objc_storeStrong((id *)&self->_rscp, a3);
}

- (NSNumber)ecn0
{
  return self->_ecn0;
}

- (void)setEcn0:(id)a3
{
  objc_storeStrong((id *)&self->_ecn0, a3);
}

- (NSNumber)rsrp
{
  return self->_rsrp;
}

- (void)setRsrp:(id)a3
{
  objc_storeStrong((id *)&self->_rsrp, a3);
}

- (NSNumber)rsrq
{
  return self->_rsrq;
}

- (void)setRsrq:(id)a3
{
  objc_storeStrong((id *)&self->_rsrq, a3);
}

- (NSNumber)snr
{
  return self->_snr;
}

- (void)setSnr:(id)a3
{
  objc_storeStrong((id *)&self->_snr, a3);
}

- (NSNumber)ecio
{
  return self->_ecio;
}

- (void)setEcio:(id)a3
{
  objc_storeStrong((id *)&self->_ecio, a3);
}

- (NSNumber)rxagc
{
  return self->_rxagc;
}

- (void)setRxagc:(id)a3
{
  objc_storeStrong((id *)&self->_rxagc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxagc, 0);
  objc_storeStrong((id *)&self->_ecio, 0);
  objc_storeStrong((id *)&self->_snr, 0);
  objc_storeStrong((id *)&self->_rsrq, 0);
  objc_storeStrong((id *)&self->_rsrp, 0);
  objc_storeStrong((id *)&self->_ecn0, 0);
  objc_storeStrong((id *)&self->_rscp, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
}

@end

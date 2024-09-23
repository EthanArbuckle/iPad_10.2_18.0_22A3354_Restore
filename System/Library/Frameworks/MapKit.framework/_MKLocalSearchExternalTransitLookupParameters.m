@implementation _MKLocalSearchExternalTransitLookupParameters

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSArray copy](self->_stationCodes, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_sourceIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSDate copy](self->_transactionDate, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[CLLocation copy](self->_transactionLocation, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (NSArray)stationCodes
{
  return self->_stationCodes;
}

- (void)setStationCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDate, a3);
}

- (CLLocation)transactionLocation
{
  return self->_transactionLocation;
}

- (void)setTransactionLocation:(id)a3
{
  objc_storeStrong((id *)&self->_transactionLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionLocation, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_stationCodes, 0);
}

@end

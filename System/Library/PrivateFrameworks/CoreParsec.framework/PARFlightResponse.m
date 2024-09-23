@implementation PARFlightResponse

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PARFlightResponse flightResults](self, "flightResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("flightResults: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)flightResults
{
  return self->_flightResults;
}

- (void)setFlightResults:(id)a3
{
  objc_storeStrong((id *)&self->_flightResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flightResults, 0);
}

+ (id)_debugResponseFromReply:(id)a3
{
  id v3;
  PARFlightResponse *v4;
  void *v5;
  uint64_t v6;
  NSArray *flightResults;

  v3 = a3;
  v4 = -[PARResponse initWithReply:]([PARFlightResponse alloc], "initWithReply:", v3);
  objc_msgSend(v3, "rawResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "parsec_mapObjectsUsingBlock:", &__block_literal_global_171);
    v6 = objc_claimAutoreleasedReturnValue();
    flightResults = v4->_flightResults;
    v4->_flightResults = (NSArray *)v6;

  }
  return v4;
}

+ (id)responseFromReply:(id)a3
{
  id v3;
  PARFlightResponse *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = -[PARResponse initWithReply:]([PARFlightResponse alloc], "initWithReply:", v3);
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D8C870]);
    objc_msgSend(v3, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C188]), "initWithProtobuf:", v8);
    objc_msgSend(v9, "flights");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PARFlightResponse setFlightResults:](v4, "setFlightResults:", v10);

  }
  return v4;
}

uint64_t __45__PARFlightResponse__debugResponseFromReply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asFlight");
}

@end

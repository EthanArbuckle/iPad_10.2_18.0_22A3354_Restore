@implementation SGFlight

- (SGFlight)initWithCarrier:(id)a3 flightNo:(id)a4 depDesc:(id)a5 arrDesc:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  SGFlight *v16;
  SGFlight *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFlightData.m"), 699, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("airline"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFlightData.m"), 700, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("flightno"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)SGFlight;
  v16 = -[SGFlight init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_airline, a3);
    objc_storeStrong((id *)&v17->_flightno, a4);
    objc_storeStrong((id *)&v17->_departureAirportDescription, a5);
    objc_storeStrong((id *)&v17->_arrivalAirportDescription, a6);
  }

  return v17;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGFlight airline](self, "airline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlight flightno](self, "flightno");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlight departureAirportDescription](self, "departureAirportDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlight arrivalAirportDescription](self, "arrivalAirportDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ from %@ to %@"), v4, v5, v6, v7);

  return v8;
}

- (NSString)flightno
{
  return self->_flightno;
}

- (NSString)airline
{
  return self->_airline;
}

- (NSString)departureAirportDescription
{
  return self->_departureAirportDescription;
}

- (NSString)arrivalAirportDescription
{
  return self->_arrivalAirportDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalAirportDescription, 0);
  objc_storeStrong((id *)&self->_departureAirportDescription, 0);
  objc_storeStrong((id *)&self->_airline, 0);
  objc_storeStrong((id *)&self->_flightno, 0);
}

@end

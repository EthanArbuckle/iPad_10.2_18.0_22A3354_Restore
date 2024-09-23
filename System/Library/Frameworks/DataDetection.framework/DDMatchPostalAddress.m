@implementation DDMatchPostalAddress

- (DDMatchPostalAddress)initWithDDScannerResult:(id)a3
{
  id v4;
  DDMatchPostalAddress *v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DDMatchPostalAddress;
  v5 = -[DDMatch initWithDDScannerResult:](&v23, sel_initWithDDScannerResult_, v4);
  if (v5)
  {
    v21 = 0;
    v22 = 0;
    v19 = 0;
    v20 = 0;
    v18 = 0;
    v6 = objc_msgSend(v4, "getStreet:city:state:zip:country:", &v22, &v21, &v20, &v19, &v18);
    v7 = v22;
    v17 = v22;
    v8 = v21;
    v16 = v21;
    v9 = v20;
    v15 = v20;
    v10 = v19;
    v11 = v19;
    v12 = v18;
    v13 = v18;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_street, v7);
      objc_storeStrong((id *)&v5->_city, v8);
      objc_storeStrong((id *)&v5->_state, v9);
      objc_storeStrong((id *)&v5->_postalCode, v10);
      objc_storeStrong((id *)&v5->_country, v12);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[DDMatchPostalAddress initWithDDScannerResult:].cold.1();
    }

  }
  return v5;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)country
{
  return self->_country;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);
}

- (void)initWithDDScannerResult:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2084CB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to extract address components from results", v0, 2u);
}

@end

@implementation CIDCPayloadBuilderDetails

- (CIDCPayloadBuilderDetails)initWithFormat:(unint64_t)a3 docType:(id)a4 elements:(id)a5 validFrom:(id)a6 validUntil:(id)a7 deviceKey:(id)a8
{
  return -[CIDCPayloadBuilderDetails initWithFormat:docType:elements:validFrom:validUntil:deviceKey:signingAlgorithm:](self, "initWithFormat:docType:elements:validFrom:validUntil:deviceKey:signingAlgorithm:", a3, a4, a5, a6, a7, a8, -8);
}

- (CIDCPayloadBuilderDetails)initWithFormat:(unint64_t)a3 docType:(id)a4 elements:(id)a5 validFrom:(id)a6 validUntil:(id)a7 deviceKey:(id)a8 signingAlgorithm:(int64_t)a9
{
  return -[CIDCPayloadBuilderDetails initWithFormat:docType:elements:validFrom:validUntil:deviceKey:signingAlgorithm:timePolicy:](self, "initWithFormat:docType:elements:validFrom:validUntil:deviceKey:signingAlgorithm:timePolicy:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (CIDCPayloadBuilderDetails)initWithFormat:(unint64_t)a3 docType:(id)a4 elements:(id)a5 validFrom:(id)a6 validUntil:(id)a7 deviceKey:(id)a8 signingAlgorithm:(int64_t)a9 timePolicy:(int64_t)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CIDCPayloadBuilderDetails *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CIDCPayloadBuilderDetails;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = -[CIDCPayloadBuilderDetails init](&v22, sel_init);
  -[CIDCPayloadBuilderDetails setFormat:](v20, "setFormat:", a3, v22.receiver, v22.super_class);
  -[CIDCPayloadBuilderDetails setDocType:](v20, "setDocType:", v19);

  -[CIDCPayloadBuilderDetails setElements:](v20, "setElements:", v18);
  -[CIDCPayloadBuilderDetails setValidFrom:](v20, "setValidFrom:", v17);

  -[CIDCPayloadBuilderDetails setValidUntil:](v20, "setValidUntil:", v16);
  -[CIDCPayloadBuilderDetails setDeviceKey:](v20, "setDeviceKey:", v15);

  -[CIDCPayloadBuilderDetails setSigningAlgorithm:](v20, "setSigningAlgorithm:", a9);
  -[CIDCPayloadBuilderDetails setTimePolicy:](v20, "setTimePolicy:", a10);
  return v20;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (NSString)docType
{
  return self->_docType;
}

- (void)setDocType:(id)a3
{
  objc_storeStrong((id *)&self->_docType, a3);
}

- (NSDictionary)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
}

- (NSDate)validFrom
{
  return self->_validFrom;
}

- (void)setValidFrom:(id)a3
{
  objc_storeStrong((id *)&self->_validFrom, a3);
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
  objc_storeStrong((id *)&self->_validUntil, a3);
}

- (int64_t)timePolicy
{
  return self->_timePolicy;
}

- (void)setTimePolicy:(int64_t)a3
{
  self->_timePolicy = a3;
}

- (NSData)deviceKey
{
  return self->_deviceKey;
}

- (void)setDeviceKey:(id)a3
{
  objc_storeStrong((id *)&self->_deviceKey, a3);
}

- (int64_t)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (void)setSigningAlgorithm:(int64_t)a3
{
  self->_signingAlgorithm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceKey, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_validFrom, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_docType, 0);
}

@end

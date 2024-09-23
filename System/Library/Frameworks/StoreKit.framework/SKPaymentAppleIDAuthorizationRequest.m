@implementation SKPaymentAppleIDAuthorizationRequest

- (SKPaymentAppleIDAuthorizationRequest)initWithClientIdentifier:(id)a3 teamIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SKPaymentAppleIDAuthorizationRequest *v10;
  id *p_isa;
  SKPaymentAppleIDAuthorizationRequest *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SKPaymentAppleIDAuthorizationRequest initWithClientIdentifier:teamIdentifier:].cold.1((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_10;
  }
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SKPaymentAppleIDAuthorizationRequest initWithClientIdentifier:teamIdentifier:].cold.2((uint64_t)self, v20, v21, v22, v23, v24, v25, v26);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v28.receiver = self;
  v28.super_class = (Class)SKPaymentAppleIDAuthorizationRequest;
  v10 = -[SKPaymentAppleIDAuthorizationRequest init](&v28, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_clientIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_11:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKPaymentAppleIDAuthorizationRequest *v4;
  uint64_t v5;
  NSString *clientIdentifier;
  uint64_t v7;
  NSString *teamIdentifier;
  uint64_t v9;
  NSString *serviceIdentifier;

  v4 = objc_alloc_init(SKPaymentAppleIDAuthorizationRequest);
  v5 = -[NSString copy](self->_clientIdentifier, "copy");
  clientIdentifier = v4->_clientIdentifier;
  v4->_clientIdentifier = (NSString *)v5;

  v7 = -[NSString copy](self->_teamIdentifier, "copy");
  teamIdentifier = v4->_teamIdentifier;
  v4->_teamIdentifier = (NSString *)v7;

  v9 = -[NSString copy](self->_serviceIdentifier, "copy");
  serviceIdentifier = v4->_serviceIdentifier;
  v4->_serviceIdentifier = (NSString *)v9;

  return v4;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)initWithClientIdentifier:(uint64_t)a3 teamIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "[%{public}@]: Client identifier is nil", a5, a6, a7, a8, 2u);
}

- (void)initWithClientIdentifier:(uint64_t)a3 teamIdentifier:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "[%{public}@]: Team identifier is nil", a5, a6, a7, a8, 2u);
}

@end

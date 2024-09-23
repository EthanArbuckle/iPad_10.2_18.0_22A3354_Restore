@implementation CRPreflightRequestComponent

- (CRPreflightRequestComponent)initWithComponentType:(id)a3 identifier:(id)a4 asid:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRPreflightRequestComponent *v12;
  CRPreflightRequestComponent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRPreflightRequestComponent;
  v12 = -[CRPreflightRequestComponent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_identifier, a4);
    objc_storeStrong((id *)&v13->_asid, a5);
    v13->_state = 0;
  }

  return v13;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)asid
{
  return self->_asid;
}

- (void)setAsid:(id)a3
{
  objc_storeStrong((id *)&self->_asid, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asid, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end

@implementation InAppBindingRequest

- (InAppBindingRequest)initWithPinningID:(id)a3
{
  id v5;
  InAppBindingRequest *v6;
  InAppBindingRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)InAppBindingRequest;
  v6 = -[InAppBindingRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pinningID, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[InAppBindingRequest pinningID](self, "pinningID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pinningId"));

}

- (InAppBindingRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  InAppBindingRequest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinningId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[InAppBindingRequest initWithPinningID:](self, "initWithPinningID:", v5);
  return v6;
}

- (NSString)pinningID
{
  return self->_pinningID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinningID, 0);
}

@end

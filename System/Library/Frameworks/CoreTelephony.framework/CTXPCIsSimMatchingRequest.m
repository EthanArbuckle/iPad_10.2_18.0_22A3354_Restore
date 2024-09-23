@implementation CTXPCIsSimMatchingRequest

- (CTXPCIsSimMatchingRequest)initWithDescriptor:(id)a3 carrierDescriptors:(id)a4
{
  id v7;
  CTXPCIsSimMatchingRequest *v8;
  CTXPCIsSimMatchingRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CTXPCIsSimMatchingRequest;
  v8 = -[CTXPCSubscriptionContextRequest initWithDescriptor:namedArguments:](&v11, sel_initWithDescriptor_namedArguments_, a3, MEMORY[0x1E0C9AA70]);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_carrierDescriptors, a4);

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCIsSimMatchingRequest carrierDescriptors](self, "carrierDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__CTXPCIsSimMatchingRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E152FCB8;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "isSimMatching:carrierDescriptors:completion:", v8, v9, v11);

}

void __73__CTXPCIsSimMatchingRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CTXPCSimCommonNumberResultResponse *v5;
  void *v6;
  CTXPCSimCommonNumberResultResponse *v7;
  id v8;

  v8 = a3;
  v5 = [CTXPCSimCommonNumberResultResponse alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CTXPCSimCommonNumberResultResponse initWithResult:](v5, "initWithResult:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 1;
}

- (CTXPCIsSimMatchingRequest)initWithCoder:(id)a3
{
  id v4;
  CTXPCIsSimMatchingRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *carrierDescriptors;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTXPCIsSimMatchingRequest;
  v5 = -[CTXPCMessage initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("carrierDescriptors"));
    v10 = objc_claimAutoreleasedReturnValue();
    carrierDescriptors = v5->_carrierDescriptors;
    v5->_carrierDescriptors = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CTXPCIsSimMatchingRequest;
  -[CTXPCMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_carrierDescriptors, CFSTR("carrierDescriptors"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)carrierDescriptors
{
  return self->_carrierDescriptors;
}

- (void)setCarrierDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_carrierDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierDescriptors, 0);
}

@end

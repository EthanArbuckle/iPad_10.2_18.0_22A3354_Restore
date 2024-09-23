@implementation MPModelResponse

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[MPModelResponse results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalItemCount") == 0;

  return v3;
}

- (MPSectionedCollection)results
{
  return self->_results;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MPModelRequest)request
{
  return self->_request;
}

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  void (**v4)(id, _QWORD);
  _QWORD block[4];
  void (**v6)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v4[2](v4, 0);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__MPModelResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke;
    block[3] = &unk_1E31637F8;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (MPModelResponse)initWithRequest:(id)a3
{
  id v5;
  MPModelResponse *v6;
  uint64_t v7;
  MPModelRequest *request;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelResponse.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)MPModelResponse;
  v6 = -[MPModelResponse init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    request = v6->_request;
    v6->_request = (MPModelRequest *)v7;

    v6->_valid = 1;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_deferredItemProperties, 0);
  objc_storeStrong((id *)&self->_deferredSectionProperties, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (MPModelResponse)init
{
  void *v4;
  MPModelRequest *v5;
  MPModelResponse *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelResponse.m"), 23, CFSTR("-initWithRequest: must be used."));

  v5 = objc_alloc_init(MPModelRequest);
  v6 = -[MPModelResponse initWithRequest:](self, "initWithRequest:", v5);

  return v6;
}

- (id)debugDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  MPPropertySet *deferredItemProperties;
  void *v8;
  MPPropertySet *deferredSectionProperties;
  void *v10;
  MPSectionedCollection *results;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (!self->_valid)
    objc_msgSend(v6, "appendString:", CFSTR("; isValid = NO"));
  deferredItemProperties = self->_deferredItemProperties;
  if (deferredItemProperties)
  {
    -[MPPropertySet debugDescription](deferredItemProperties, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; deferredItemProperties = %@"), v8);

  }
  deferredSectionProperties = self->_deferredSectionProperties;
  if (deferredSectionProperties)
  {
    -[MPPropertySet debugDescription](deferredSectionProperties, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; deferredSectionProperties = %@"), v10);

  }
  results = self->_results;
  if (results)
  {
    -[MPSectionedCollection debugDescription](results, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; results = %@"), v12);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  MPPropertySet *deferredItemProperties;
  void *v8;
  MPPropertySet *deferredSectionProperties;
  void *v10;
  MPSectionedCollection *results;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (!self->_valid)
    objc_msgSend(v6, "appendString:", CFSTR("; isValid = NO"));
  deferredItemProperties = self->_deferredItemProperties;
  if (deferredItemProperties)
  {
    -[MPPropertySet description](deferredItemProperties, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; deferredItemProperties = %@"), v8);

  }
  deferredSectionProperties = self->_deferredSectionProperties;
  if (deferredSectionProperties)
  {
    -[MPPropertySet description](deferredSectionProperties, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; deferredSectionProperties = %@"), v10);

  }
  results = self->_results;
  if (results)
  {
    -[MPSectionedCollection description](results, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; results = %@"), v12);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)_invalidate
{
  id v3;

  if (self->_valid)
  {
    self->_valid = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPModelResponseDidInvalidateNotification"), self);

  }
}

- (MPPropertySet)deferredSectionProperties
{
  return self->_deferredSectionProperties;
}

- (void)setDeferredSectionProperties:(id)a3
{
  objc_storeStrong((id *)&self->_deferredSectionProperties, a3);
}

- (MPPropertySet)deferredItemProperties
{
  return self->_deferredItemProperties;
}

- (void)setDeferredItemProperties:(id)a3
{
  objc_storeStrong((id *)&self->_deferredItemProperties, a3);
}

uint64_t __67__MPModelResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

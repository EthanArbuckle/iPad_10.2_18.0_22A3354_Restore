@implementation DMFFetchClassroomInstructorEndpointResultObject

- (DMFFetchClassroomInstructorEndpointResultObject)initWithEndpoint:(id)a3
{
  id v5;
  DMFFetchClassroomInstructorEndpointResultObject *v6;
  DMFFetchClassroomInstructorEndpointResultObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchClassroomInstructorEndpointResultObject;
  v6 = -[CATTaskResultObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_endpoint, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchClassroomInstructorEndpointResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchClassroomInstructorEndpointResultObject *v5;
  void *v6;
  uint64_t v7;
  NSXPCListenerEndpoint *endpoint;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchClassroomInstructorEndpointResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("endpoint"));
    v7 = objc_claimAutoreleasedReturnValue();
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchClassroomInstructorEndpointResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchClassroomInstructorEndpointResultObject endpoint](self, "endpoint", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("endpoint"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DMFFetchClassroomInstructorEndpointResultObject endpoint](self, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\tEndpoint: %@\n}>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end

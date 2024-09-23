@implementation DDSTrialQuery

+ (id)defaultQuery
{
  return -[DDSTrialQuery initWithProjectId:namespaceId:]([DDSTrialQuery alloc], "initWithProjectId:namespaceId:", 104, 170);
}

- (DDSTrialQuery)initWithProjectId:(int)a3 namespaceId:(unsigned int)a4
{
  DDSTrialQuery *v6;
  DDSTrialQuery *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *description;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)DDSTrialQuery;
  v6 = -[DDSTrialQuery init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_projectId = a3;
    v6->_namespaceId = a4;
    v15[0] = CFSTR("projectId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DDSTrialQuery projectId](v6, "projectId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("namespaceId");
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DDSTrialQuery namespaceId](v7, "namespaceId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "description");
    v11 = objc_claimAutoreleasedReturnValue();
    description = v7->_description;
    v7->_description = (NSString *)v11;

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  int v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[DDSTrialQuery namespaceId](self, "namespaceId"), v7 == objc_msgSend(v6, "namespaceId")))
  {
    v8 = -[DDSTrialQuery projectId](self, "projectId");
    v9 = v8 == objc_msgSend(v6, "projectId");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[DDSTrialQuery projectId](self, "projectId");
  return -[DDSTrialQuery namespaceId](self, "namespaceId") ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[DDSTrialQuery projectId](self, "projectId"), CFSTR("projectId"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[DDSTrialQuery namespaceId](self, "namespaceId"), CFSTR("namespaceId"));

}

- (DDSTrialQuery)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  DDSTrialQuery *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("projectId"));
  if ((_DWORD)v5 && (v6 = v5, v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("namespaceId")), (_DWORD)v7))
  {
    self = -[DDSTrialQuery initWithProjectId:namespaceId:](self, "initWithProjectId:namespaceId:", v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return objc_getProperty(self, a2, 16, 1);
}

- (int)projectId
{
  return self->_projectId;
}

- (unsigned)namespaceId
{
  return self->_namespaceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
}

@end

@implementation IRCandidate

- (IRCandidate)initWithCandidateIdentifier:(id)a3
{
  id v5;
  IRCandidate *v6;
  IRCandidate *v7;
  uint64_t v8;
  NSSet *nodes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRCandidate;
  v6 = -[IRCandidate init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_candidateIdentifier, a3);
    v8 = objc_opt_new();
    nodes = v7->_nodes;
    v7->_nodes = (NSSet *)v8;

  }
  return v7;
}

- (void)updateNodes:(id)a3
{
  NSSet *v4;
  NSSet *nodes;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  nodes = self->_nodes;
  self->_nodes = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCandidateIdentifier:", self->_candidateIdentifier);
  v6 = -[NSString copyWithZone:](self->_candidateIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSSet copyWithZone:](self->_nodes, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  -[IRCandidate avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v5[2];
  v5[2] = v10;

  -[IRCandidate rapportIdentifier](self, "rapportIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v5[3];
  v5[3] = v12;

  -[IRCandidate idsIdentifier](self, "idsIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v5[4];
  v5[4] = v14;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *candidateIdentifier;
  id v5;

  candidateIdentifier = self->_candidateIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", candidateIdentifier, CFSTR("candidateIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nodes, CFSTR("nodes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_avOutpuDeviceIdentifier, CFSTR("avOutpuDeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rapportIdentifier, CFSTR("rapportIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idsIdentifier, CFSTR("idsIdentifier"));

}

- (IRCandidate)initWithCoder:(id)a3
{
  id v4;
  IRCandidate *v5;
  IRCandidate *v6;
  uint64_t v7;
  NSString *candidateIdentifier;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSSet *nodes;
  void *v14;
  uint64_t v15;
  NSString *avOutpuDeviceIdentifier;
  void *v17;
  uint64_t v18;
  NSString *rapportIdentifier;
  void *v20;
  uint64_t v21;
  NSString *idsIdentifier;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IRCandidate;
  v5 = -[IRCandidate init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidateIdentifier"));
    v6 = (IRCandidate *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_self();
      v7 = objc_claimAutoreleasedReturnValue();

      candidateIdentifier = v5->_candidateIdentifier;
      v5->_candidateIdentifier = (NSString *)v7;

      v9 = (void *)MEMORY[0x24BDBCF20];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("nodes"));
      v6 = (IRCandidate *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_opt_self();
        v12 = objc_claimAutoreleasedReturnValue();

        nodes = v5->_nodes;
        v5->_nodes = (NSSet *)v12;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avOutpuDeviceIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v15 = objc_claimAutoreleasedReturnValue();

        avOutpuDeviceIdentifier = v5->_avOutpuDeviceIdentifier;
        v5->_avOutpuDeviceIdentifier = (NSString *)v15;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rapportIdentifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v18 = objc_claimAutoreleasedReturnValue();

        rapportIdentifier = v5->_rapportIdentifier;
        v5->_rapportIdentifier = (NSString *)v18;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsIdentifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v21 = objc_claimAutoreleasedReturnValue();

        idsIdentifier = v5->_idsIdentifier;
        v5->_idsIdentifier = (NSString *)v21;

        v6 = v5;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", candidateIdentifier: %@"), self->_candidateIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", avOutpuDeviceIdentifier: %@"), self->_avOutpuDeviceIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", rapportIdentifier: %@"), self->_rapportIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", idsIdentifier: %@"), self->_idsIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", nodes: %@"), self->_nodes);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IRCandidate candidateIdentifier](self, "candidateIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidateIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[IRCandidate candidateIdentifier](self, "candidateIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "candidateIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
        goto LABEL_15;
    }
    -[IRCandidate nodes](self, "nodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {

    }
    else
    {
      -[IRCandidate nodes](self, "nodes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nodes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
        goto LABEL_15;
    }
    -[IRCandidate avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avOutpuDeviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqual:", v16))
    {

    }
    else
    {
      -[IRCandidate avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "avOutpuDeviceIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v18)
        goto LABEL_15;
    }
    -[IRCandidate rapportIdentifier](self, "rapportIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rapportIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqual:", v20))
    {

      goto LABEL_18;
    }
    -[IRCandidate rapportIdentifier](self, "rapportIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rapportIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 == v22)
    {
LABEL_18:
      -[IRCandidate idsIdentifier](self, "idsIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "idsIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqual:", v25))
      {

        v8 = 1;
      }
      else
      {
        -[IRCandidate idsIdentifier](self, "idsIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "idsIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v26 != v27;

        v8 = !v28;
      }
      goto LABEL_16;
    }
LABEL_15:
    v8 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v8 = 0;
LABEL_17:

  return v8 & 1;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_candidateIdentifier, "hash");
  v4 = -[NSString hash](self->_avOutpuDeviceIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_rapportIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_idsIdentifier, "hash");
  return v6 ^ -[NSSet hash](self->_nodes, "hash");
}

- (NSString)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (NSString)avOutpuDeviceIdentifier
{
  return self->_avOutpuDeviceIdentifier;
}

- (void)setAvOutpuDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_avOutpuDeviceIdentifier, a3);
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (void)setRapportIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_rapportIdentifier, a3);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifier, a3);
}

- (NSSet)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_avOutpuDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_candidateIdentifier, 0);
}

@end

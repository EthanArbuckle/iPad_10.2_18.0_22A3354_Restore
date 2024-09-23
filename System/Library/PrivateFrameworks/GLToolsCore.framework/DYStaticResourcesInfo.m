@implementation DYStaticResourcesInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYStaticResourcesInfo;
  -[DYStaticResourcesInfo dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYStaticResourcesInfo)initWithCoder:(id)a3
{
  DYStaticResourcesInfo *v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)DYStaticResourcesInfo;
  v4 = -[DYStaticResourcesInfo init](&v26, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v4->textures = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("textures"));
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v4->renderbuffers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), CFSTR("renderbuffers"));
    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v4->framebuffers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), CFSTR("framebuffers"));
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v4->buffers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), CFSTR("buffers"));
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v4->vertexArrays = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), CFSTR("vertexArrays"));
    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    v4->queries = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0), CFSTR("queries"));
    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v4->shaders = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0), CFSTR("shaders"));
    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v4->programs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0), CFSTR("programs"));
    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    v4->programPipelines = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0), CFSTR("programPipelines"));
  }
  return v4;
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYStaticResourcesInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@\n\ttextures = %@\n\trenderbuffers = %@\n\tframebuffers = %@\n\tbuffers = %@\n\tvertexArrays = %@\n\tqueries = %@\n\tshaders = %@\n\tprograms = %@\n\tprogramPipelines = %@"), -[DYStaticResourcesInfo debugDescription](&v3, sel_debugDescription), -[DYStaticResourcesInfo description](self, "description"), -[NSArray debugDescription](self->textures, "debugDescription"), -[NSArray debugDescription](self->renderbuffers, "debugDescription"), -[NSArray debugDescription](self->framebuffers, "debugDescription"), -[NSArray debugDescription](self->buffers, "debugDescription"), -[NSArray debugDescription](self->vertexArrays, "debugDescription"), -[NSArray debugDescription](self->queries, "debugDescription"), -[NSArray debugDescription](self->shaders, "debugDescription"), -[NSArray debugDescription](self->programs, "debugDescription"), -[NSArray debugDescription](self->programs, "debugDescription"));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->textures, CFSTR("textures"));
  objc_msgSend(a3, "encodeObject:forKey:", self->renderbuffers, CFSTR("renderbuffers"));
  objc_msgSend(a3, "encodeObject:forKey:", self->framebuffers, CFSTR("framebuffers"));
  objc_msgSend(a3, "encodeObject:forKey:", self->buffers, CFSTR("buffers"));
  objc_msgSend(a3, "encodeObject:forKey:", self->vertexArrays, CFSTR("vertexArrays"));
  objc_msgSend(a3, "encodeObject:forKey:", self->queries, CFSTR("queries"));
  objc_msgSend(a3, "encodeObject:forKey:", self->shaders, CFSTR("shaders"));
  objc_msgSend(a3, "encodeObject:forKey:", self->programs, CFSTR("programs"));
  objc_msgSend(a3, "encodeObject:forKey:", self->programPipelines, CFSTR("programPipelines"));
}

- (NSArray)textures
{
  return self->textures;
}

- (void)setTextures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)renderbuffers
{
  return self->renderbuffers;
}

- (void)setRenderbuffers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSArray)framebuffers
{
  return self->framebuffers;
}

- (void)setFramebuffers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSArray)buffers
{
  return self->buffers;
}

- (void)setBuffers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSArray)vertexArrays
{
  return self->vertexArrays;
}

- (void)setVertexArrays:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSArray)queries
{
  return self->queries;
}

- (void)setQueries:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSArray)shaders
{
  return self->shaders;
}

- (void)setShaders:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSArray)programs
{
  return self->programs;
}

- (void)setPrograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSArray)programPipelines
{
  return self->programPipelines;
}

- (void)setProgramPipelines:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end

@implementation MPMusicPlayerPlayParametersQueueDescriptor

- (MPMusicPlayerPlayParametersQueueDescriptor)initWithPlayParametersQueue:(NSArray *)playParametersQueue
{
  NSArray *v4;
  MPMusicPlayerPlayParametersQueueDescriptor *v5;
  uint64_t v6;
  NSArray *v7;
  objc_super v9;

  v4 = playParametersQueue;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  v5 = -[MPMusicPlayerQueueDescriptor _init](&v9, sel__init);
  if (v5)
  {
    v6 = -[NSArray copy](v4, "copy");
    v7 = v5->_playParametersQueue;
    v5->_playParametersQueue = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  char v9;
  char v10;
  MPMusicPlayerPlayParameters *v11;
  MPMusicPlayerPlayParameters *v12;
  MPMusicPlayerPlayParameters *v13;
  char v14;
  MPMusicPlayerPlayParameters *v15;
  MPMusicPlayerPlayParameters *v16;
  MPMusicPlayerPlayParameters *v17;
  char v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  if (-[MPMusicPlayerQueueDescriptor isEqual:](&v20, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (NSArray *)v5[10];
    v7 = self->_playParametersQueue;
    v8 = v7;
    if (v7 == v6)
      v9 = 1;
    else
      v9 = -[NSArray isEqual:](v7, "isEqual:", v6);

    v11 = (MPMusicPlayerPlayParameters *)v5[11];
    v12 = self->_startItemPlayParameters;
    v13 = v12;
    if (v12 == v11)
      v14 = 1;
    else
      v14 = -[MPMusicPlayerPlayParameters isEqual:](v12, "isEqual:", v11);

    v15 = (MPMusicPlayerPlayParameters *)v5[12];
    v16 = self->_containerPlayParameters;
    v17 = v16;
    if (v16 == v15)
      v18 = 1;
    else
      v18 = -[MPMusicPlayerPlayParameters isEqual:](v16, "isEqual:", v15);

    v10 = v9 & v14 & v18;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MPMusicPlayerPlayParametersQueueDescriptor)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerPlayParametersQueueDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *playParametersQueue;
  uint64_t v11;
  MPMusicPlayerPlayParameters *startItemPlayParameters;
  uint64_t v13;
  MPMusicPlayerPlayParameters *containerPlayParameters;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  v5 = -[MPMusicPlayerQueueDescriptor initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPMusicPlayerPlayParametersQueueDescriptorPlayParameters"));
    v9 = objc_claimAutoreleasedReturnValue();
    playParametersQueue = v5->_playParametersQueue;
    v5->_playParametersQueue = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerPlayParametersQueueDescriptorStartItemPlayParameters"));
    v11 = objc_claimAutoreleasedReturnValue();
    startItemPlayParameters = v5->_startItemPlayParameters;
    v5->_startItemPlayParameters = (MPMusicPlayerPlayParameters *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerPlayParametersQueueDescriptorContainerPlayParameters"));
    v13 = objc_claimAutoreleasedReturnValue();
    containerPlayParameters = v5->_containerPlayParameters;
    v5->_containerPlayParameters = (MPMusicPlayerPlayParameters *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  v4 = a3;
  -[MPMusicPlayerQueueDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_playParametersQueue, CFSTR("MPMusicPlayerPlayParametersQueueDescriptorPlayParameters"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startItemPlayParameters, CFSTR("MPMusicPlayerPlayParametersQueueDescriptorStartItemPlayParameters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerPlayParameters, CFSTR("MPMusicPlayerPlayParametersQueueDescriptorContainerPlayParameters"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  v4 = -[MPMusicPlayerQueueDescriptor copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_playParametersQueue, "copy");
  v6 = (void *)v4[10];
  v4[10] = v5;

  v7 = -[MPMusicPlayerPlayParameters copy](self->_startItemPlayParameters, "copy");
  v8 = (void *)v4[11];
  v4[11] = v7;

  v9 = -[MPMusicPlayerPlayParameters copy](self->_containerPlayParameters, "copy");
  v10 = (void *)v4[12];
  v4[12] = v9;

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p queue=%@ startItem=%@ container: %@>"), objc_opt_class(), self, self->_playParametersQueue, self->_startItemPlayParameters, self->_containerPlayParameters);
}

- (void)setStartTime:(NSTimeInterval)startTime forItemWithPlayParameters:(MPMusicPlayerPlayParameters *)playParameters
{
  id v6;

  -[MPMusicPlayerPlayParameters identifiers](playParameters, "identifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerQueueDescriptor _setStartTime:forIdentifiers:](self, "_setStartTime:forIdentifiers:", v6, startTime);

}

- (void)setEndTime:(NSTimeInterval)endTime forItemWithPlayParameters:(MPMusicPlayerPlayParameters *)playParameters
{
  id v6;

  -[MPMusicPlayerPlayParameters identifiers](playParameters, "identifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerQueueDescriptor _setEndTime:forIdentifiers:](self, "_setEndTime:forIdentifiers:", v6, endTime);

}

- (NSArray)playParametersQueue
{
  return (NSArray *)(id)-[NSArray copy](self->_playParametersQueue, "copy");
}

- (BOOL)isEmpty
{
  return -[NSArray count](self->_playParametersQueue, "count") == 0;
}

- (void)setContainerPlayParameters:(id)a3
{
  MPMusicPlayerPlayParameters *v4;
  MPMusicPlayerPlayParameters *containerPlayParameters;

  v4 = (MPMusicPlayerPlayParameters *)objc_msgSend(a3, "copy");
  containerPlayParameters = self->_containerPlayParameters;
  self->_containerPlayParameters = v4;

}

- (id)containerPlayParameters
{
  return self->_containerPlayParameters;
}

- (void)setPlayParametersQueue:(NSArray *)playParametersQueue
{
  objc_setProperty_nonatomic_copy(self, a2, playParametersQueue, 80);
}

- (MPMusicPlayerPlayParameters)startItemPlayParameters
{
  return self->_startItemPlayParameters;
}

- (void)setStartItemPlayParameters:(MPMusicPlayerPlayParameters *)startItemPlayParameters
{
  objc_storeStrong((id *)&self->_startItemPlayParameters, startItemPlayParameters);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPlayParameters, 0);
  objc_storeStrong((id *)&self->_startItemPlayParameters, 0);
  objc_storeStrong((id *)&self->_playParametersQueue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

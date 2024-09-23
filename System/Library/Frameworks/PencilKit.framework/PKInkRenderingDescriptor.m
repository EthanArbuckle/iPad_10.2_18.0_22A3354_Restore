@implementation PKInkRenderingDescriptor

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)blendMode
{
  return self->_blendMode;
}

- (PKInkRenderingDescriptor)initWithType:(unint64_t)a3 blendMode:(unint64_t)a4 alternateMode:(unint64_t)a5 particleDescriptor:(id)a6 secondaryParticleDescriptor:(id)a7
{
  id v13;
  id v14;
  PKInkRenderingDescriptor *v15;
  PKInkRenderingDescriptor *v16;
  objc_super v18;

  v13 = a6;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)PKInkRenderingDescriptor;
  v15 = -[PKInkRenderingDescriptor init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v15->_blendMode = a4;
    v15->_alternateMode = a5;
    objc_storeStrong((id *)&v15->_particleDescriptor, a6);
    objc_storeStrong((id *)&v16->_secondaryParticleDescriptor, a7);
  }

  return v16;
}

- (id)mutableCopy
{
  return -[PKInkRenderingDescriptor initWithType:blendMode:alternateMode:particleDescriptor:secondaryParticleDescriptor:]([PKInkRenderingDescriptor alloc], "initWithType:blendMode:alternateMode:particleDescriptor:secondaryParticleDescriptor:", self->_type, self->_blendMode, self->_alternateMode, self->_particleDescriptor, self->_secondaryParticleDescriptor);
}

- (unint64_t)alternateMode
{
  return self->_alternateMode;
}

- (PKInkParticleDescriptor)particleDescriptor
{
  return self->_particleDescriptor;
}

- (PKInkParticleDescriptor)secondaryParticleDescriptor
{
  return self->_secondaryParticleDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryParticleDescriptor, 0);
  objc_storeStrong((id *)&self->_particleDescriptor, 0);
}

@end

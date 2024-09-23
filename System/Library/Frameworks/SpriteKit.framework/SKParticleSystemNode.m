@implementation SKParticleSystemNode

- (void)_makeBackingNode
{
  SKCParticleSystemNode *v2;

  v2 = (SKCParticleSystemNode *)operator new();
  SKCParticleSystemNode::SKCParticleSystemNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKParticleSystemNode;
  -[SKNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skcParticleSystemNode = -[SKNode _backingNode](self, "_backingNode");
}

@end

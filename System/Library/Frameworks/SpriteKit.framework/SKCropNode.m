@implementation SKCropNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
  SKCCropNode *v2;

  v2 = (SKCCropNode *)operator new();
  SKCCropNode::SKCCropNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKCropNode;
  -[SKNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skcCropNode = -[SKNode _backingNode](self, "_backingNode");
}

- (SKCropNode)initWithCoder:(id)a3
{
  id v4;
  SKCropNode *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKCropNode;
  v5 = -[SKNode initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKCropNode setMaskNode:](v5, "setMaskNode:", v6);

    -[SKCropNode setPrefersAlphaMask:](v5, "setPrefersAlphaMask:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersAlphaMask")));
    -[SKCropNode setInvertMask:](v5, "setInvertMask:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_invertMask")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKCropNode;
  -[SKNode encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_mask, CFSTR("_mask"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SKCropNode prefersAlphaMask](self, "prefersAlphaMask"), CFSTR("_prefersAlphaMask"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SKCropNode invertMask](self, "invertMask"), CFSTR("_invertMask"));

}

- (void)setMaskNode:(SKNode *)maskNode
{
  SKNode *v5;

  v5 = maskNode;
  objc_storeStrong((id *)&self->_mask, maskNode);
  SKCCropNode::setMaskNode((SKCNode *)self->_skcCropNode, (SKCNode *)-[SKNode _backingNode](v5, "_backingNode"));

}

- (SKNode)maskNode
{
  return self->_mask;
}

- (BOOL)isEqualToNode:(id)a3
{
  SKCropNode *v4;
  SKCropNode *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = (SKCropNode *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v12.receiver = self;
      v12.super_class = (Class)SKCropNode;
      if (-[SKNode isEqualToNode:](&v12, sel_isEqualToNode_, v5))
      {
        -[SKCropNode maskNode](self, "maskNode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {

        }
        else
        {
          -[SKCropNode maskNode](v5, "maskNode");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
          {
            v7 = 1;
            goto LABEL_11;
          }
        }
        -[SKCropNode maskNode](self, "maskNode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKCropNode maskNode](v5, "maskNode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "isEqualToNode:", v10);

      }
      else
      {
        v7 = 0;
      }
LABEL_11:

      goto LABEL_12;
    }
    v7 = 0;
  }
LABEL_12:

  return v7;
}

- (BOOL)prefersAlphaMask
{
  return *((_BYTE *)self->_skcCropNode + 688);
}

- (void)setPrefersAlphaMask:(BOOL)a3
{
  SKCCropNode::setForceAlphaMask((SKCNode *)self->_skcCropNode, a3);
}

- (BOOL)invertMask
{
  return *((_BYTE *)self->_skcCropNode + 689);
}

- (void)setInvertMask:(BOOL)a3
{
  SKCCropNode::setInvertMask((SKCNode *)self->_skcCropNode, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKCropNode;
  v4 = -[SKNode copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPrefersAlphaMask:", -[SKCropNode prefersAlphaMask](self, "prefersAlphaMask"));
  objc_msgSend(v4, "setInvertMask:", -[SKCropNode invertMask](self, "invertMask"));
  -[SKCropNode maskNode](self, "maskNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMaskNode:", v6);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
}

@end

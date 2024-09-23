@implementation VNMPClusteringTreeNodeWrapper

- (VNMPClusteringTreeNodeWrapper)initWithNode:(void *)a3 freeNodeOnDealloc:(BOOL)a4
{
  _BOOL8 v4;
  VNMPClusteringTreeNodeWrapper *v6;
  VNMPClusteringTreeNodeWrapper *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)VNMPClusteringTreeNodeWrapper;
  v6 = -[VNMPClusteringTreeNodeWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[VNMPClusteringTreeNodeWrapper setNode:](v6, "setNode:", a3);
    -[VNMPClusteringTreeNodeWrapper setFreeNodeOnDealloc:](v7, "setFreeNodeOnDealloc:", v4);
  }
  return v7;
}

- (int)nodeId
{
  return *((_DWORD *)self->_node + 2);
}

- (id)descriptor
{
  return *(id *)self->_node;
}

- (id)left
{
  uint64_t v2;
  VNMPClusteringTreeNodeWrapper *v3;

  v2 = *((_QWORD *)self->_node + 3);
  if (v2)
    v3 = -[VNMPClusteringTreeNodeWrapper initWithNode:freeNodeOnDealloc:]([VNMPClusteringTreeNodeWrapper alloc], "initWithNode:freeNodeOnDealloc:", v2, 0);
  else
    v3 = 0;
  return v3;
}

- (id)right
{
  uint64_t v2;
  VNMPClusteringTreeNodeWrapper *v3;

  v2 = *((_QWORD *)self->_node + 4);
  if (v2)
    v3 = -[VNMPClusteringTreeNodeWrapper initWithNode:freeNodeOnDealloc:]([VNMPClusteringTreeNodeWrapper alloc], "initWithNode:freeNodeOnDealloc:", v2, 0);
  else
    v3 = 0;
  return v3;
}

- (float)distance
{
  return *((float *)self->_node + 3);
}

- (float)avgDistance
{
  return *((float *)self->_node + 4);
}

- (int)leafsCount
{
  return *((_DWORD *)self->_node + 5);
}

- (id)getLeafNodes
{
  void *v2;
  id var0;
  _QWORD *v4;
  _QWORD *v5;
  VNMPClusteringTreeNodeWrapper *v6;
  MPClusteringTreeNode v8;

  MPClusteringTreeNode::getLeafNodes(&v8, (uint64_t)self->_node);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = v8.var0;
  v4 = *(_QWORD **)&v8.var1;
  if (v8.var0 != *(id *)&v8.var1)
  {
    v5 = v8.var0;
    do
    {
      v6 = -[VNMPClusteringTreeNodeWrapper initWithNode:freeNodeOnDealloc:]([VNMPClusteringTreeNodeWrapper alloc], "initWithNode:freeNodeOnDealloc:", *v5, 0);
      objc_msgSend(v2, "addObject:", v6);

      ++v5;
    }
    while (v5 != v4);
  }
  if (var0)
    operator delete(var0);
  return v2;
}

- (void)dealloc
{
  MPClusteringTreeNode *node;
  objc_super v4;

  node = (MPClusteringTreeNode *)self->_node;
  if (node && self->_freeNodeOnDealloc)
  {
    MPClusteringTreeNode::freeNodeAndItsSubtree(node);
    self->_node = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNMPClusteringTreeNodeWrapper;
  -[VNMPClusteringTreeNodeWrapper dealloc](&v4, sel_dealloc);
}

- (void)node
{
  return self->_node;
}

- (void)setNode:(void *)a3
{
  self->_node = a3;
}

- (BOOL)freeNodeOnDealloc
{
  return self->_freeNodeOnDealloc;
}

- (void)setFreeNodeOnDealloc:(BOOL)a3
{
  self->_freeNodeOnDealloc = a3;
}

@end

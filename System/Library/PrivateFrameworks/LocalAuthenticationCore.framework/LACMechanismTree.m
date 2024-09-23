@implementation LACMechanismTree

- (LACMechanismTree)initWithChildren:(id)a3 isAndNode:(BOOL)a4
{
  id v7;
  LACMechanismTree *v8;
  LACMechanismTree *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LACMechanismTree;
  v8 = -[LACMechanismTree init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_value = -1;
    v8->_isAnd = a4;
    objc_storeStrong((id *)&v8->_children, a3);
  }

  return v9;
}

- (LACMechanismTree)initWithValue:(int64_t)a3
{
  LACMechanismTree *v4;
  LACMechanismTree *v5;
  NSArray *children;
  NSArray *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LACMechanismTree;
  v4 = -[LACMechanismTree init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isAnd = 0;
    children = v4->_children;
    v7 = (NSArray *)MEMORY[0x24BDBD1A8];
    v4->_value = a3;
    v4->_children = v7;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[LACMechanismTree value](self, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("value: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[LACMechanismTree children](self, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("children: [%@]"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isAnd: %d"), -[LACMechanismTree isAnd](self, "isAnd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("; "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isAnd
{
  return self->_isAnd;
}

- (int64_t)value
{
  return self->_value;
}

- (NSArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

- (BOOL)isSatisfiableWithValue:(int64_t)a3
{
  LACMechanismTree *v4;

  v4 = self;
  LOBYTE(a3) = LACMechanismTree.isSatisfiable(withValue:)(a3);

  return a3 & 1;
}

+ (id)mechanismTreeFromSerializedTree:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  swift_getObjCClassMetadata();
  v8 = 0;
  v6 = (void *)static LACMechanismTree.parse(tree:index:)(v3, v5, &v8);
  swift_bridgeObjectRelease();
  return v6;
}

@end

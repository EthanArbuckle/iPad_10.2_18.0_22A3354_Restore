@implementation MTRThreadNetworkDiagnosticsClusterRouteTableStruct

- (MTRThreadNetworkDiagnosticsClusterRouteTableStruct)init
{
  MTRThreadNetworkDiagnosticsClusterRouteTableStruct *v2;
  MTRThreadNetworkDiagnosticsClusterRouteTableStruct *v3;
  NSNumber *extAddress;
  NSNumber *rloc16;
  NSNumber *routerId;
  NSNumber *nextHop;
  NSNumber *pathCost;
  NSNumber *lqiIn;
  NSNumber *lqiOut;
  NSNumber *age;
  NSNumber *allocated;
  NSNumber *linkEstablished;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTRThreadNetworkDiagnosticsClusterRouteTableStruct;
  v2 = -[MTRThreadNetworkDiagnosticsClusterRouteTableStruct init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    extAddress = v2->_extAddress;
    v2->_extAddress = (NSNumber *)&unk_250591B18;

    rloc16 = v3->_rloc16;
    v3->_rloc16 = (NSNumber *)&unk_250591B18;

    routerId = v3->_routerId;
    v3->_routerId = (NSNumber *)&unk_250591B18;

    nextHop = v3->_nextHop;
    v3->_nextHop = (NSNumber *)&unk_250591B18;

    pathCost = v3->_pathCost;
    v3->_pathCost = (NSNumber *)&unk_250591B18;

    lqiIn = v3->_lqiIn;
    v3->_lqiIn = (NSNumber *)&unk_250591B18;

    lqiOut = v3->_lqiOut;
    v3->_lqiOut = (NSNumber *)&unk_250591B18;

    age = v3->_age;
    v3->_age = (NSNumber *)&unk_250591B18;

    allocated = v3->_allocated;
    v3->_allocated = (NSNumber *)&unk_250591B18;

    linkEstablished = v3->_linkEstablished;
    v3->_linkEstablished = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThreadNetworkDiagnosticsClusterRouteTableStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;

  v4 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterRouteTableStruct);
  objc_msgSend_extAddress(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtAddress_(v4, v8, (uint64_t)v7);

  objc_msgSend_rloc16(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRloc16_(v4, v12, (uint64_t)v11);

  objc_msgSend_routerId(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRouterId_(v4, v16, (uint64_t)v15);

  objc_msgSend_nextHop(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNextHop_(v4, v20, (uint64_t)v19);

  objc_msgSend_pathCost(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPathCost_(v4, v24, (uint64_t)v23);

  objc_msgSend_lqiIn(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLqiIn_(v4, v28, (uint64_t)v27);

  objc_msgSend_lqiOut(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLqiOut_(v4, v32, (uint64_t)v31);

  objc_msgSend_age(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAge_(v4, v36, (uint64_t)v35);

  objc_msgSend_allocated(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAllocated_(v4, v40, (uint64_t)v39);

  objc_msgSend_linkEstablished(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLinkEstablished_(v4, v44, (uint64_t)v43);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: extAddress:%@; rloc16:%@; routerId:%@; nextHop:%@; pathCost:%@; lqiIn:%@; lqiOut:%@; age:%@; allocated:%@; linkEstablished:%@; >"),
    v5,
    self->_extAddress,
    self->_rloc16,
    self->_routerId,
    self->_nextHop,
    self->_pathCost,
    self->_lqiIn,
    self->_lqiOut,
    self->_age,
    self->_allocated,
    self->_linkEstablished);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)extAddress
{
  return self->_extAddress;
}

- (void)setExtAddress:(NSNumber *)extAddress
{
  objc_setProperty_nonatomic_copy(self, a2, extAddress, 8);
}

- (NSNumber)rloc16
{
  return self->_rloc16;
}

- (void)setRloc16:(NSNumber *)rloc16
{
  objc_setProperty_nonatomic_copy(self, a2, rloc16, 16);
}

- (NSNumber)routerId
{
  return self->_routerId;
}

- (void)setRouterId:(NSNumber *)routerId
{
  objc_setProperty_nonatomic_copy(self, a2, routerId, 24);
}

- (NSNumber)nextHop
{
  return self->_nextHop;
}

- (void)setNextHop:(NSNumber *)nextHop
{
  objc_setProperty_nonatomic_copy(self, a2, nextHop, 32);
}

- (NSNumber)pathCost
{
  return self->_pathCost;
}

- (void)setPathCost:(NSNumber *)pathCost
{
  objc_setProperty_nonatomic_copy(self, a2, pathCost, 40);
}

- (NSNumber)lqiIn
{
  return self->_lqiIn;
}

- (void)setLqiIn:(NSNumber *)lqiIn
{
  objc_setProperty_nonatomic_copy(self, a2, lqiIn, 48);
}

- (NSNumber)lqiOut
{
  return self->_lqiOut;
}

- (void)setLqiOut:(NSNumber *)lqiOut
{
  objc_setProperty_nonatomic_copy(self, a2, lqiOut, 56);
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(NSNumber *)age
{
  objc_setProperty_nonatomic_copy(self, a2, age, 64);
}

- (NSNumber)allocated
{
  return self->_allocated;
}

- (void)setAllocated:(NSNumber *)allocated
{
  objc_setProperty_nonatomic_copy(self, a2, allocated, 72);
}

- (NSNumber)linkEstablished
{
  return self->_linkEstablished;
}

- (void)setLinkEstablished:(NSNumber *)linkEstablished
{
  objc_setProperty_nonatomic_copy(self, a2, linkEstablished, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEstablished, 0);
  objc_storeStrong((id *)&self->_allocated, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_lqiOut, 0);
  objc_storeStrong((id *)&self->_lqiIn, 0);
  objc_storeStrong((id *)&self->_pathCost, 0);
  objc_storeStrong((id *)&self->_nextHop, 0);
  objc_storeStrong((id *)&self->_routerId, 0);
  objc_storeStrong((id *)&self->_rloc16, 0);
  objc_storeStrong((id *)&self->_extAddress, 0);
}

@end

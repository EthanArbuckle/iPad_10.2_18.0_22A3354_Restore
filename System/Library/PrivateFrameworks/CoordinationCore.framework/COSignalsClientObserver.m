@implementation COSignalsClientObserver

- (COSignalsClientObserver)initWithConnection:(id)a3 cluster:(id)a4
{
  return -[COClientObserver initWithConnection:domain:cluster:](self, "initWithConnection:domain:cluster:", a3, CFSTR("signals"), a4);
}

- (COSignalsClientObserver)initWithConnection:(id)a3 asAccessory:(id)a4 constraints:(id)a5 cluster:(id)a6
{
  id v10;
  id v11;
  COSignalsClientObserver *v12;
  uint64_t v13;
  COHomeKitAccessoryMemento *accessory;
  uint64_t v15;
  NSSet *constraints;

  v10 = a4;
  v11 = a5;
  v12 = -[COSignalsClientObserver initWithConnection:cluster:](self, "initWithConnection:cluster:", a3, a6);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    accessory = v12->_accessory;
    v12->_accessory = (COHomeKitAccessoryMemento *)v13;

    v15 = objc_msgSend(v11, "copy");
    constraints = v12->_constraints;
    v12->_constraints = (NSSet *)v15;

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COSignalsClientObserver;
  if (-[COClientObserver isEqual:](&v9, sel_isEqual_, v4))
  {
    -[COSignalsClientObserver constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (COHomeKitAccessoryMemento)accessory
{
  return self->_accessory;
}

- (NSSet)constraints
{
  return self->_constraints;
}

- (BOOL)canDispatch
{
  return self->_canDispatch;
}

- (void)setCanDispatch:(BOOL)a3
{
  self->_canDispatch = a3;
}

- (OS_nw_activity)dispatchabilityStallActivity
{
  return self->_dispatchabilityStallActivity;
}

- (void)setDispatchabilityStallActivity:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchabilityStallActivity, a3);
}

- (unint64_t)dispatchabilityStallCount
{
  return self->_dispatchabilityStallCount;
}

- (void)setDispatchabilityStallCount:(unint64_t)a3
{
  self->_dispatchabilityStallCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchabilityStallActivity, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end

@implementation PKReplicaEntry

- (PKReplicaEntry)initWithReplicaUUIDIndex:(unsigned int)a3 clock:(unsigned int)a4 subclock:(unsigned int)a5 inUse:(BOOL)a6 forDrawing:(id)a7
{
  PKReplicaEntry *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKReplicaEntry;
  result = -[PKReplicaEntry init](&v13, sel_init);
  if (result)
  {
    result->_replicaUUIDIndex = a3;
    result->_clock = a4;
    result->_subclock = a5;
    result->_inUse = a6;
    result->_drawing = (PKDrawingConcrete *)a7;
  }
  return result;
}

- (PKReplicaEntry)initWithCoder:(id)a3
{
  id v4;
  PKReplicaEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKReplicaEntry;
  v5 = -[PKReplicaEntry init](&v7, sel_init);
  if (v5)
  {
    v5->_replicaUUIDIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ReplicaIndex"));
    v5->_clock = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ReplicaClock"));
    v5->_subclock = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ReplicaSubclock"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_replicaUUIDIndex, CFSTR("ReplicaIndex"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_clock, CFSTR("ReplicaClock"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_subclock, CFSTR("ReplicaSubclock"));

}

- (id)description
{
  const __CFString *v2;

  v2 = CFSTR("In Use");
  if (!self->_inUse)
    v2 = CFSTR("Available");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Replica %d: %d.%d (%@)"), self->_replicaUUIDIndex, self->_clock, self->_subclock, v2);
}

- (unsigned)replicaUUIDIndex
{
  return self->_replicaUUIDIndex;
}

- (void)setReplicaUUIDIndex:(unsigned int)a3
{
  self->_replicaUUIDIndex = a3;
}

- (unsigned)clock
{
  return self->_clock;
}

- (void)setClock:(unsigned int)a3
{
  self->_clock = a3;
}

- (unsigned)subclock
{
  return self->_subclock;
}

- (void)setSubclock:(unsigned int)a3
{
  self->_subclock = a3;
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (PKDrawingConcrete)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  self->_drawing = (PKDrawingConcrete *)a3;
}

@end

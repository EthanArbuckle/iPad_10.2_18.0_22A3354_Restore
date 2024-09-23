@implementation CHPointFIFO

- (CHPointFIFO)initWithFIFO:(id)a3
{
  id v5;
  CHPointFIFO *v6;
  CHPointFIFO *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHPointFIFO;
  v6 = -[CHPointFIFO init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_nextFIFO, a3);

  return v7;
}

- (void)emitPoint:(CHPointFIFO *)self
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (self)
    self = self->_nextFIFO;
  objc_msgSend_addPoint_(self, a2, v2, v3, v4, v5);
}

- (void)flush
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_flush(self->_nextFIFO, a2, v2, v3, v4, v5);
}

- (void)clear
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_clear(self->_nextFIFO, a2, v2, v3, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextFIFO, 0);
}

@end

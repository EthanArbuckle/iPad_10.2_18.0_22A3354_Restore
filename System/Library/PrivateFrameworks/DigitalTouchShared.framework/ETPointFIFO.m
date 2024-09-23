@implementation ETPointFIFO

- (ETPointFIFO)initWithFIFO:(id)a3
{
  id v4;
  ETPointFIFO *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ETPointFIFO;
  v5 = -[ETPointFIFO init](&v7, sel_init);
  if (v5)
    objc_msgSend(v4, "setNextFIFO:", v5);

  return v5;
}

- (void)emitPoints:(ETPointFIFO *)self count:(SEL)a2
{
  -[ETPointFIFO addPoints:count:](self->_nextFIFO, "addPoints:count:");
}

- (void)flush
{
  -[ETPointFIFO flush](self->_nextFIFO, "flush");
}

- (void)clear
{
  -[ETPointFIFO clear](self->_nextFIFO, "clear");
}

- (ETPointFIFO)nextFIFO
{
  return self->_nextFIFO;
}

- (void)setNextFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_nextFIFO, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextFIFO, 0);
}

@end

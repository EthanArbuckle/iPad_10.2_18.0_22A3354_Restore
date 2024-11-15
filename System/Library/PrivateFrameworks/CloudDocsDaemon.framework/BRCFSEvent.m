@implementation BRCFSEvent

- (BRCFSEvent)initWithPath:(id)a3 flags:(unsigned int)a4 eventID:(unint64_t)a5
{
  id v9;
  BRCFSEvent *v10;
  BRCFSEvent *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCFSEvent;
  v10 = -[BRCFSEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_path, a3);
    v11->_flags = a4;
    v11->_eventID = a5;
  }

  return v11;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unint64_t)eventID
{
  return self->_eventID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end

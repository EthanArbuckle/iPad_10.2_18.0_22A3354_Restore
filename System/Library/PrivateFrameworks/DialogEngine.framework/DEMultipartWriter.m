@implementation DEMultipartWriter

- (DEMultipartWriter)initWithWriter:(id)a3
{
  id v5;
  DEMultipartWriter *v6;
  DEMultipartWriter *v7;
  DEWriter *writer;
  void *v9;
  DEMultipartWriter *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DEMultipartWriter;
  v6 = -[DEMultipartWriter init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_writer, a3);
    v7->_partClosed = 0;
    writer = v7->_writer;
    +[DEMultipartUtil getBoundaryData](DEMultipartUtil, "getBoundaryData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEWriter writeData:](writer, "writeData:", v9);

    v10 = v7;
  }

  return v7;
}

- (DEMultipartWriter)init
{
  return -[DEMultipartWriter initWithWriter:](self, "initWithWriter:", 0);
}

- (void)dealloc
{
  DEWriter *writer;
  DEWriter *v4;
  objc_super v5;

  writer = self->_writer;
  if (writer)
  {
    -[DEWriter close](writer, "close");
    v4 = self->_writer;
    self->_writer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)DEMultipartWriter;
  -[DEMultipartWriter dealloc](&v5, sel_dealloc);
}

- (void)closeMessage
{
  DEWriter *writer;
  void *v4;
  DEWriter *v5;

  if (self->_writer)
  {
    -[DEMultipartWriter close](self, "close");
    writer = self->_writer;
    +[DEMultipartUtil getMessageEndData](DEMultipartUtil, "getMessageEndData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEWriter writeData:](writer, "writeData:", v4);

    -[DEWriter close](self->_writer, "close");
    v5 = self->_writer;
    self->_writer = 0;

  }
}

- (void)close
{
  DEWriter *writer;
  void *v4;

  if (!self->_partClosed)
  {
    writer = self->_writer;
    +[DEMultipartUtil getPartEndData](DEMultipartUtil, "getPartEndData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEWriter writeData:](writer, "writeData:", v4);

    self->_partClosed = 1;
  }
}

- (void)newPart
{
  DEWriter *writer;
  void *v4;

  -[DEMultipartWriter close](self, "close");
  writer = self->_writer;
  +[DEMultipartUtil getBoundaryData](DEMultipartUtil, "getBoundaryData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEWriter writeData:](writer, "writeData:", v4);

  self->_partClosed = 0;
}

- (void)writeData:(id)a3
{
  -[DEWriter writeData:](self->_writer, "writeData:", a3);
}

- (DEWriter)writer
{
  return self->_writer;
}

- (void)setWriter:(id)a3
{
  objc_storeStrong((id *)&self->_writer, a3);
}

- (BOOL)partClosed
{
  return self->_partClosed;
}

- (void)setPartClosed:(BOOL)a3
{
  self->_partClosed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
}

@end

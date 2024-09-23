@implementation _ML3MutableDatabaseConnectionPoolDiagnostic

- (void)setReaderAvailableConnections:(id)a3
{
  NSArray *v4;
  NSArray *readerAvailableConnections;

  if (self->super._readerAvailableConnections != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    readerAvailableConnections = self->super._readerAvailableConnections;
    self->super._readerAvailableConnections = v4;

  }
}

- (void)setReaderBusyConnections:(id)a3
{
  NSArray *v4;
  NSArray *readerBusyConnections;

  if (self->super._readerBusyConnections != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    readerBusyConnections = self->super._readerBusyConnections;
    self->super._readerBusyConnections = v4;

  }
}

- (void)setWriterAvailableConnections:(id)a3
{
  NSArray *v4;
  NSArray *writerAvailableConnections;

  if (self->super._writerAvailableConnections != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    writerAvailableConnections = self->super._writerAvailableConnections;
    self->super._writerAvailableConnections = v4;

  }
}

- (void)setWriterBusyConnections:(id)a3
{
  NSArray *v4;
  NSArray *writerBusyConnections;

  if (self->super._writerBusyConnections != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    writerBusyConnections = self->super._writerBusyConnections;
    self->super._writerBusyConnections = v4;

  }
}

@end

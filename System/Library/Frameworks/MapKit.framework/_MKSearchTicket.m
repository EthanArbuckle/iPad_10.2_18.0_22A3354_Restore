@implementation _MKSearchTicket

- (_MKSearchTicket)initWithSearchTicket:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKSearchTicket;
  return -[_MKTicket initWithTicket:](&v4, sel_initWithTicket_, a3);
}

- (NSString)searchQuery
{
  return (NSString *)-[GEOMapServiceTicket searchQuery](self->super._ticket, "searchQuery");
}

@end

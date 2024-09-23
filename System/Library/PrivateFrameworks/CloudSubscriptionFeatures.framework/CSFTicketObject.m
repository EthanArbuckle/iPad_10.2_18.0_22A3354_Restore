@implementation CSFTicketObject

- (CSFTicketObject)initWithTicket:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  CSFTicketObject *v7;
  CSFTicketObject *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSFTicketObject;
  v7 = -[CSFTicketObject init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CSFTicketObject setTicket:](v7, "setTicket:", v6);
    -[CSFTicketObject setStatus:](v8, "setStatus:", a4);
  }

  return v8;
}

- (NSString)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end

@implementation BPSSubscriberList

- (BPSSubscriberList)init
{
  BPSSubscriberList *v2;
  void *v3;
  uint64_t v4;
  NSMutableArray *items;
  uint64_t v6;
  NSMutableArray *tickets;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BPSSubscriberList;
  v2 = -[BPSSubscriberList init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
    v4 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    items = v2->_items;
    v2->_items = (NSMutableArray *)v4;

    v6 = objc_msgSend(v3, "mutableCopy");
    tickets = v2->_tickets;
    v2->_tickets = (NSMutableArray *)v6;

    v2->_nextTicket = 0;
  }
  return v2;
}

- (int64_t)appendElement:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[BPSSubscriberList nextTicket](self, "nextTicket");
  -[BPSSubscriberList setNextTicket:](self, "setNextTicket:", -[BPSSubscriberList nextTicket](self, "nextTicket") + 1);
  -[BPSSubscriberList items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  -[BPSSubscriberList tickets](self, "tickets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  return v5;
}

- (void)removeTicket:(int64_t)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSSubscriberList.m"), 35, CFSTR("Ticket should be greater than zero"));

  }
  if (-[BPSSubscriberList nextTicket](self, "nextTicket") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSSubscriberList.m"), 36, CFSTR("Ticket should be less than next ticket"));

  }
  -[BPSSubscriberList tickets](self, "tickets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:", v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BPSSubscriberList items](self, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", v8);

    -[BPSSubscriberList tickets](self, "tickets");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", v8);

  }
}

- (id)claimAll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BPSSubscriberList items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[BPSSubscriberList items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[BPSSubscriberList tickets](self, "tickets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  return v4;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSMutableArray)tickets
{
  return self->_tickets;
}

- (void)setTickets:(id)a3
{
  objc_storeStrong((id *)&self->_tickets, a3);
}

- (int64_t)nextTicket
{
  return self->_nextTicket;
}

- (void)setNextTicket:(int64_t)a3
{
  self->_nextTicket = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickets, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end

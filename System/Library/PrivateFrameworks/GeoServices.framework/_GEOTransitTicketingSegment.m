@implementation _GEOTransitTicketingSegment

- (_GEOTransitTicketingSegment)initWithSegment:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _GEOTransitTicketingSegment *v9;
  _GEOTransitTicketingSegment *v10;
  _GEOTransitTicketingSegment *v11;
  objc_super v13;

  v5 = a3;
  objc_msgSend(v5, "ticketingUrl");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "segmentName"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v13.receiver = self;
    v13.super_class = (Class)_GEOTransitTicketingSegment;
    v9 = -[_GEOTransitTicketingSegment init](&v13, sel_init);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_segment, a3);
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)ticketingUrl
{
  return -[GEOTransitTicketingSegment ticketingUrl](self->_segment, "ticketingUrl");
}

- (NSString)segmentName
{
  return -[GEOTransitTicketingSegment segmentName](self->_segment, "segmentName");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segment, 0);
}

@end

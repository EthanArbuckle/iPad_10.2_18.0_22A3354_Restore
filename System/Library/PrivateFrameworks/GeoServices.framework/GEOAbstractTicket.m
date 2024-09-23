@implementation GEOAbstractTicket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlerToken, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

- (GEOAbstractTicket)initWithTraits:(id)a3
{
  id v5;
  GEOAbstractTicket *v6;
  GEOAbstractTicket *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAbstractTicket;
  v6 = -[GEOAbstractTicket init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_traits, a3);

  return v7;
}

- (BOOL)isCancelled
{
  GEOAbstractTicket *v2;
  BOOL cancelled;

  v2 = self;
  objc_sync_enter(v2);
  cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (GEOAbstractTicket)init
{
  GEOAbstractTicket *result;

  result = (GEOAbstractTicket *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOAbstractTicket;
  -[GEOAbstractTicket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapServiceTraits formattedText](self->_traits, "formattedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ traits: %@ "), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cancel
{
  GEOAbstractTicket *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = 1;
  objc_sync_exit(obj);

}

- (void)setThrottlerToken:(id)a3
{
  objc_storeStrong((id *)&self->_throttlerToken, a3);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

@end

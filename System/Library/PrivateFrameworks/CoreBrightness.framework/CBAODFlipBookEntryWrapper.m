@implementation CBAODFlipBookEntryWrapper

- (CBAODFlipBookEntryWrapper)initWithFlipBookEntry:(id *)a3
{
  uint64_t v3;
  objc_super v6;
  $7D12C9F9DF7F825FC3F2BA39AA26C9BC *v7;
  SEL v8;
  CBAODFlipBookEntryWrapper *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CBAODFlipBookEntryWrapper;
  v9 = -[CBAODFlipBookEntryWrapper init](&v6, sel_init);
  if (v9)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, 79);
    v9->_entryData = (NSData *)v3;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAODFlipBookEntryWrapper *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBAODFlipBookEntryWrapper;
  -[CBAODFlipBookEntryWrapper dealloc](&v2, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  void *v8;
  unsigned int *v9;

  v9 = -[NSData bytes](self->_entryData, "bytes");
  v8 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_opt_class();
  v3 = "set";
  if ((v9[1] & 1) != 0)
    v4 = "set";
  else
    v4 = "not set";
  if ((*((_BYTE *)v9 + 51) & 1) != 0)
    v5 = "set";
  else
    v5 = "not set";
  if ((*((_BYTE *)v9 + 46) & 1) != 0)
    v6 = "set";
  else
    v6 = "not set";
  if ((*((_BYTE *)v9 + 9) & 1) == 0)
    v3 = "not set";
  return (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: ID=%i | brt-%f (%s) | limit=%f (%s) | pcc=%f (%s) | WP %s"), v2, *v9, *(float *)((char *)v9 + 5), v4, *((float *)v9 + 13), v5, *(float *)((char *)v9 + 47), v6, v3);
}

- ($7D12C9F9DF7F825FC3F2BA39AA26C9BC)entry
{
  return ($7D12C9F9DF7F825FC3F2BA39AA26C9BC *)-[NSData bytes](self->_entryData, "bytes", a2, self);
}

- (NSData)entryData
{
  return self->_entryData;
}

@end

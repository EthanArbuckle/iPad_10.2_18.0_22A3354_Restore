@implementation NWConcrete_nw_ids_info

- (void)dealloc
{
  char *session_id;
  char *pseudonym;
  char *push_token;
  objc_super v6;

  session_id = self->session_id;
  if (session_id)
  {
    free(session_id);
    self->session_id = 0;
  }
  pseudonym = self->pseudonym;
  if (pseudonym)
  {
    free(pseudonym);
    self->pseudonym = 0;
  }
  push_token = self->push_token;
  if (push_token)
  {
    free(push_token);
    self->push_token = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_ids_info;
  -[NWConcrete_nw_ids_info dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)(id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<nw_ids_info session:%s pseudonym:%s pushtoken:%s>"), self->session_id, self->pseudonym, self->push_token);
}

@end
